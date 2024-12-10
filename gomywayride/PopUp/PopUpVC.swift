//
//  PopUpVC.swift
//  GomywayCanada
//
//  Created by meet sharma on 04/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit

class PopUpVC: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var heightTitleLbl: NSLayoutConstraint!
    var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()

        uiSet()
    }
    func uiSet(){
        if isComing == true{
       
            lblTitle.text =  "Profile Updated"
        }else{
            lblTitle.text =  "Bank Detail Updated"
        }
    }

    @IBAction func actionOk(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
