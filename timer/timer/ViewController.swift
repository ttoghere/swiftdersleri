//
//  ViewController.swift
//  timer
//
//  Created by İsmail Tunç Kankılıç on 21.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    var counter=0
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 10
        timeLabel.text="Time: \(counter)"
        //Planlı timer kodu örneği
        //objectivec fonksiyonlar ile başlayınca parantez içine alıp
        //Parantezin dışına #selector eklenir ve aşağıda olan örnek gibi fonksiyon çağırmadan kodlanır
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func timerFunction(){
        timeLabel.text="Time: \(counter)"
        counter-=1
        if(counter == 0){
            timer.invalidate()
            timeLabel.text="Time is over"
        }
    }
    
    /*
     //Yanlış Versiyon
     override func viewDidAppear(_ animated: Bool) {
         counter = 10
         for time in 1...10{
             counter = counter-1
             timeLabel.text = "Time: \(counter)"
             Thread.sleep(forTimeInterval: 1)
         }
     }
     */

    @IBAction func buttonClicked(_ sender: Any) {
        print("Button Clicked")
    }
}

