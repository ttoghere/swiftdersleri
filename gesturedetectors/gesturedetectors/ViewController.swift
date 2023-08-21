//
//  ViewController.swift
//  gesturedetectors
//
//  Created by İsmail Tunç Kankılıç on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personalIMG: UIImageView!
    var tunc = true
    
    
    @objc func changePic(){
   
        if tunc == true{
            //Resim değişim ataması
            personalIMG.image = UIImage(named: "ben")
            nameLabel.text = "Tuncinyo12"
            tunc = false
        }else{
            personalIMG.image = UIImage(named: "ben2")
            nameLabel.text = "Tunç Kankılıç"
            tunc = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Gesture etkileşimi aktif hale gelir
        personalIMG.isUserInteractionEnabled = true
        //Gesture etkileşimi oluşturulur
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        //Gesture etkileşimi implamente edilir
        personalIMG.addGestureRecognizer(gestureRecognizer)
    }
 


}

