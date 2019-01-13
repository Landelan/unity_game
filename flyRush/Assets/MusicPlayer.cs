using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MusicPlayer : MonoBehaviour
{

    private void Awake()
    {
        DontDestroyOnLoad(gameObject);
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    void Update()
    {
        Invoke("LoadNextScene", 5f);
    }

    void LoadNextScene()
    {
        SceneManager.LoadScene(1);
    }

}
