//
//  ViewController.swift
//  alertsandregistration
//
//  Created by İsmail Tunç Kankılıç on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pageLabel: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var rePassTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(
            title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            (UIAlertAction)in
            print("button clicked")
        }
        alert.addAction(okButton)
        self.present(alert,animated: true,completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if (usernameTextField.text == "") {
     makeAlert(titleInput: "Error", messageInput: "Fill your Username Field")
        }else if(passwordTextfield.text == ""){
            makeAlert(titleInput: "Error", messageInput: "Fill your Password Field")
        }else if(rePassTextfield.text != passwordTextfield.text){
            makeAlert(titleInput: "Error", messageInput: "Passwords doesn't match")
        }else if(rePassTextfield.text == ""){
            makeAlert(titleInput: "Error", messageInput: "Fill your Repassword Field")
        }else{
            makeAlert(titleInput: "Success", messageInput: "Welcome to out app !! :D")
        }
    }
}

/*
 //Kullanıcı bulunamadı alert kontrolü
 let alert = UIAlertController(title: "Error", message: "Username Not Found!!!", preferredStyle: UIAlertController.Style.alert)
 //Alarm etkileşim butonu
 let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
     (UIAlertAction)in
     print("button clicked")
 }
 alert.addAction(okButton)
 self.present(alert, animated: true,completion: nil)
 */

/*
 if passwordTextfield.text?.isEmpty == true{
     let alert = UIAlertController(
         title: "Error", message: "Password Not Found", preferredStyle: UIAlertController.Style.alert)
     let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
         (UIAlertAction)in
         print("button clicked")
     }
     alert.addAction(okButton)
 }
 if rePassTextfield.text?.isEmpty==true{
     let alert = UIAlertController(
         title: "Error", message: "RePassword Not Found", preferredStyle: UIAlertController.Style.alert)
     let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
         (UIAlertAction)in
         print("button clicked")
     }
     alert.addAction(okButton)
     
 }
 if rePassTextfield.text != passwordTextfield.text{
     let alert = UIAlertController(
         title: "Error", message: "Passwords Not Matching", preferredStyle: UIAlertController.Style.alert)
     let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
         (UIAlertAction)in
         print("button clicked")
     }
     alert.addAction(okButton)
 }
 
 */
