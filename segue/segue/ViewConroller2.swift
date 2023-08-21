//
//  ViewConroller2.swift
//  segue
//
//  Created by İsmail Tunç Kankılıç on 21.08.2023.
//

import UIKit

class ViewConroller2: UIViewController {
    

    @IBOutlet var viewcontroltitle: UIView!
    
    @IBOutlet weak var namelabel: UILabel!
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namelabel.text = myName
    }
    
}
