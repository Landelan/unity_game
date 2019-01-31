using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.CrossPlatformInput;

public class ControllerShip : MonoBehaviour
{

    public GameObject Rocket;
    public GameObject Camera;
    public Transform target;

    [Tooltip("in m/s")] [SerializeField] float Speed = 30f;
    [Tooltip("in m")] [SerializeField] float xRange = 10f;
    [Tooltip("in m")] [SerializeField] float yRange = 8f;

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {


        float horizontalThrow = CrossPlatformInputManager.GetAxis("Horizontal");
        float verticalThrow = CrossPlatformInputManager.GetAxis("Vertical");
        float xOffset = horizontalThrow * Speed * Time.deltaTime;
        float yOffset = verticalThrow * Speed * Time.deltaTime;
        //CrossPlatformInputManager.GetButton()

        float xPossition = transform.localPosition.x + xOffset;
        float xLimits = Mathf.Clamp(xPossition, -xRange, xRange);

        float yPossition = transform.localPosition.y + yOffset;
        float yLimits = Mathf.Clamp(yPossition, -yRange, yRange);

        transform.localPosition = new Vector3(xLimits, yLimits, transform.localPosition.z);


        float xrotationLimits = Mathf.Clamp(horizontalThrow, -1, 1);
        float yrotationLimits = Mathf.Clamp(verticalThrow, -1, 1);

        if (horizontalThrow != 0)
        {
            transform.Rotate(0f, 0f, xrotationLimits);
        }
        else if (verticalThrow != 0)
        {
            transform.Rotate(-yrotationLimits * 2, 0f, 0f);
        }
        else
        {
            Rocket.transform.rotation = Quaternion.RotateTowards(transform.rotation, target.rotation, 0.5f);
        }

    }

    void OnTriggerEnter(Collider other)
    {

        Debug.Log("loo");
    }

}