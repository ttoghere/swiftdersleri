//
//  DetailsViewController.swift
//  kentsimgeleri
//
//  Created by İsmail Tunç Kankılıç on 22.08.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //Widgets
    @IBOutlet weak var cityImages: UIImageView!
    @IBOutlet weak var cityNames: UILabel!
    //Variables
    var selectedLandmarkNames = ""
    var selectedLandmarkImages=UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Değişkenlere atanan bilgilerin eşlenmesi
        cityNames.text = selectedLandmarkNames
        cityImages.image = selectedLandmarkImages
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
