//
//  ViewController.swift
//  temeloperasyonlar
//
//  Created by İsmail Tunç Kankılıç on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var birthdayTextfield: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBD = UserDefaults.standard.object(forKey: "birthday")
        //as? yada as! castingler olmaktadır
        if let newName = storedName as? String{
            nameLabel.text = newName
        }
        if let newBD = storedBD as? String{
            birthdayLabel.text = newBD
        }
    }


    @IBAction func removeClicked(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBD = UserDefaults.standard.object(forKey: "birthday")
        if(storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        if(storedBD as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday:"
        }
    }
    
    @IBAction func saveCilcked(_ sender: Any) {
        UserDefaults.standard.set(nameTextfield.text, forKey: "name")
        UserDefaults.standard.set(birthdayTextfield.text, forKey: "birthday")
        nameLabel.text = "Name: \(nameTextfield.text ?? "Name:")"
        birthdayLabel.text = "Birthday: \(birthdayTextfield.text ?? "Birthday:")"

    }
    
}

