using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Obstacles : MonoBehaviour
{

    [SerializeField] Vector3 movementVector;


    // 13 - 8
    [SerializeField] [Range(0,1)] float movementRagne;

    Vector3 startingPosition;

    // Start is called before the first frame update
    void Start()
    {
        startingPosition = transform.position;
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 offset = movementVector * movementRagne;
        transform.position = startingPosition - offset;
    }
}
