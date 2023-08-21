//
//  ViewController.swift
//  segue
//
//  Created by İsmail Tunç Kankılıç on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewcontroltitle: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    var userName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameText.text = ""
        print("ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewDidDisappear")
    }

  
    

    
    
    
    @IBAction func nextbutton(_ sender: Any) {
         userName = nameText.text!
        performSegue(withIdentifier: "twosecvc", sender: nil)
    }
    
    //Segue anında aktarımı sağlar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "twosecvc"{
            let destinationVC = segue.destination as! ViewConroller2
            destinationVC.myName = userName
        }
    }
    
}

