using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Obstacles : MonoBehaviour
{

    [SerializeField] Vector3 movementVector = new Vector3(0f, 5f, 0f);
    [SerializeField] float period = 2f;

    // 13 - 8
    // SerializeField] [Range(0,1)] float movementRagne;

    float movementRagne;
    Vector3 startingPosition;

    // Start is called before the first frame update
    void Start()
    {
        startingPosition = transform.position;
    }

    // Update is called once per frame
    void Update()
    {
        if (period == 0) { return;  }
        float time = Time.time / 2;
        float cycles = time / period;
        const float PI = Mathf.PI * 2;
        float SinWave = Mathf.Sin(cycles * PI);

        movementRagne = SinWave;

        Vector3 offset = movementVector * movementRagne;
        transform.position = startingPosition - offset;
    }
}
