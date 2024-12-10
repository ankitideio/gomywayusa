//
//  DeletePopUpVC.swift
//  GomywayCanada
//
//  Created by meet sharma on 17/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit

class DeletePopUpVC: UIViewController {
    var callBack:(()->())?
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    @IBAction func actionCancel(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func actionConfirm(_ sender: UIButton) {
        dismiss(animated: false)
        callBack?()
    }
}
