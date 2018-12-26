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

    // Start is called before the first frame update
    void Start()
    {
        rigidbody = GetComponent<Rigidbody>();
        audioSource = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {
        ProcessInput();
    }

    void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.tag == "Platform")
        {
            Debug.Log("Finish!");
            SceneManager.LoadScene(1);
        }
        else if (collision.gameObject.tag == "Obstacles")
        {
            Debug.Log("Dead!");
            SceneManager.LoadScene(0);
        }
        else if (collision.gameObject.tag == "Earth")
        {
            Debug.Log("Earth Dead!");
            SceneManager.LoadScene(0);
        }
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
