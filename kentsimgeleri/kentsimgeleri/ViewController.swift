//
//  ViewController.swift
//  kentsimgeleri
//
//  Created by İsmail Tunç Kankılıç on 22.08.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    //Variables
    //Kaynak Oluşturma
    var landmarkNames = [String]()
    //Asset eklemede null check gereklidir
    var landmarkImage=[UIImage]()
    var choosenLandmarkImage = UIImage()
    var choosenLandmarkName = ""

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Kütüphane kullanmak için başlangıç şartı
        //Delegasyonu net olarak işlemek
        tableView.delegate = self
        //Datasoureu net olarak işlemek
        tableView.dataSource = self
        /********************************************************************************/
        landmarkNames.append("Colosseum")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Great Wall")
        landmarkNames.append("StonHenge")
        landmarkNames.append("Taj Mahal")
        /********************************************************************************/
        landmarkImage.append(UIImage(named: "colosseum.jpg")!)
        landmarkImage.append(UIImage(named: "great-wall.jpg")!)
        landmarkImage.append(UIImage(named: "taj-mahal.jpg")!)
        landmarkImage.append(UIImage(named: "kremlin.jpg")!)
        landmarkImage.append(UIImage(named: "stonehenge.jpg")!)
    }
    
    //Hücre sayısını belirler
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    //Hücre içi gösterilecek olan datayı gösterir
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //Kullanılmaz hale gelecektir yakında
        //Kullanılması gereken format aşağıdadır
        //cell.textLabel?.text="Test"
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    //View interaksiyonu
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosenLandmarkName = landmarkNames[indexPath.row]
        choosenLandmarkImage = landmarkImage[indexPath.row]
        //Veri aktarımı ile sayfa geçişi
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    //Sayfa geçişi veri aktarımı için ayar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedLandmarkNames = choosenLandmarkName
            destinationVC.selectedLandmarkImages = choosenLandmarkImage
           // destinationVC.imageView?.image = choosenLandmarkImage
        }
    }
    
    //Veri silme methodu
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImage.remove(at: indexPath.row)
            //Silme sonrası tableView güncellemesi
            //tableView.reloadData()
            //Table View Dosya Silme
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }


}

