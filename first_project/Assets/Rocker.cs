using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Rocker : MonoBehaviour
{
    [SerializeField] float rcsTrust = 10f;
    [SerializeField] float mainTrust = 50f;
    Rigidbody rigidbody;
    AudioSource audioSource;

    enum State { Alive, Dying, Transcending }
    State state = State.Alive;

    // Start is called before the first frame update
    void Start()
    {
        rigidbody = GetComponent<Rigidbody>();
        audioSource = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {
        Debug.Log(state);
        if (state == State.Alive)
        {
            ProcessInput();
        }

    }

    void OnCollisionEnter(Collision collision)
    {
        if (state != State.Alive)
        {
            return;
        }

        if (collision.gameObject.tag == "Platform")
        {
            Debug.Log("Finish!");
            state = State.Transcending;
            Invoke("LoadNextScene", 1f);
        }
        else if (collision.gameObject.tag == "Obstacles")
        {
            Debug.Log("Dead!");
            state = State.Dying;
            Invoke("LoadFirstScene", 1f);
        }
        else if (collision.gameObject.tag == "Earth")
        {
            Debug.Log("Earth Dead!");
            state = State.Dying;
            Invoke("LoadFirstScene", 1f);
        }
    }

    private void LoadFirstScene()
    {
        SceneManager.LoadScene(0);
    }

    private void LoadNextScene()
    {
        SceneManager.LoadScene(1);
    }

    private void ProcessInput()
    {

        RunRocket(mainTrust);
        RotationRocker(rcsTrust);
    }

    private void RunRocket(float mainTrust)
    {
        if (Input.GetKey(KeyCode.Space))
        {
            rigidbody.AddRelativeForce(Vector3.up * mainTrust);
            if (!audioSource.isPlaying)
            {
                audioSource.Play();
            }
        }
        else
        {
            audioSource.Stop();
        }
    }

    private void RotationRocker(float rcsTrust)
    {
        float rotateSpeed = rcsTrust * Time.deltaTime;
        rigidbody.freezeRotation = true;
        if (Input.GetKey(KeyCode.A)) { transform.Rotate(Vector3.forward * rotateSpeed); }
        if (Input.GetKey(KeyCode.D)) { transform.Rotate(-Vector3.forward * rotateSpeed); }
        rigidbody.freezeRotation = false;
    }
}
