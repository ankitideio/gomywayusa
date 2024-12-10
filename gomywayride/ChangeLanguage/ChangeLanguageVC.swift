//
//  ChangeLanguageVC.swift
//  GomywayCanada
//
//  Created by meet sharma on 22/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit

class ChangeLanguageVC: UIViewController {

    @IBOutlet weak var imgVwFrenchTick: UIImageView!
    @IBOutlet weak var imgVwEnglishTick: UIImageView!
    @IBOutlet weak var vwOuter: UIView!
    
    var callBack:(()->())?
    override func viewDidLoad() {
        super.viewDidLoad()
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "es" {
            self.title = "changeLanguage".localizeString(string: "es")
            imgVwFrenchTick.image = UIImage(named: "24")
            imgVwEnglishTick.image = UIImage(named: "")
        } else {
            self.title = "changeLanguage".localizeString(string: "en")
            imgVwFrenchTick.image = UIImage(named: "")
            imgVwEnglishTick.image = UIImage(named: "24")
        }
  
        vwOuter.ShadowColorView()
    }
    
    
    
    @IBAction func actionEnglishBtn(_ sender: UIButton) {
        self.title = "changeLanguage".localizeString(string: "en")
        imgVwFrenchTick.image = UIImage(named: "")
        imgVwEnglishTick.image = UIImage(named: "24")
        UserDefaults.standard.set("en", forKey: "selectLanguage")
        NotificationCenter.default.post(name: Notification.Name("ChangeLanguage"), object: nil)
        self.navigationController?.popViewController(animated: true)
        callBack?()

    }
    
    @IBAction func actionFrenchBtn(_ sender: UIButton) {
        self.title = "changeLanguage".localizeString(string: "es")
        UserDefaults.standard.set("es", forKey: "selectLanguage")
        imgVwFrenchTick.image = UIImage(named: "24")
        imgVwEnglishTick.image = UIImage(named: "")
        NotificationCenter.default.post(name: Notification.Name("ChangeLanguage"), object: nil)
       self.navigationController?.popViewController(animated: true)
        callBack?()
       
    }
}
