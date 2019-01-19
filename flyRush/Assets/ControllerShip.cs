using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.CrossPlatformInput;

public class ControllerShip : MonoBehaviour
{

    [Tooltip("in m/s")][SerializeField] float xSpeed = 4f;
    [Tooltip("in m")] [SerializeField] float xRange = 10f;

    // Start is called before the first frame update
    void Start() 
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        float horizontalThrow = CrossPlatformInputManager.GetAxis("Horizontal");
        float xOffset = horizontalThrow * xSpeed * Time.deltaTime;
        //CrossPlatformInputManager.GetButton()

        float xPossition = transform.localPosition.x + xOffset;
        float xLimits = Mathf.Clamp(xPossition, -xRange, xRange);

        transform.localPosition = new Vector3(xLimits, transform.localPosition.y, transform.localPosition.z);
    }
}
