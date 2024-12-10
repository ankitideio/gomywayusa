//
//  PhoneverifyVC.swift
//  gomywayride
//
//  Created by Prince dhiman on 07/10/22.
//  Copyright © 2022 Snow-Macmini-1. All rights reserved.
//

import UIKit
import CountryPickerView

import FacebookCore
import SwiftyJSON
class PhoneverifyVC: UIViewController,CountryPickerViewDelegate,CountryPickerViewDataSource {
    
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var lblEnterMobile: UILabel!
    @IBOutlet weak var lblChooseCountryCode: UILabel!
    @IBOutlet weak var lblOtpVerifyTitle: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPhoneVerify: UILabel!
    @IBOutlet weak var numberTextFeild: UITextField!
    
    @IBOutlet weak var CountryPicker: CountryPickerView!
    let cpv = CountryPickerView()
    var newVar = ""
    var idNew = ""
    var viewmodel = AuthVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let country = cpv.selectedCountry
        CountryPicker.delegate = self
        CountryPicker.dataSource = self
        cpv.showPhoneCodeInView = false
        cpv.showCountryNameInView = false

      setLanguage()
    }
    private func setLanguage(){
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "es" {
            lblPhoneVerify.text = "phoneVerification".localizeString(string: "es")
            lblTitle.text = "phoneVerifyTitle".localizeString(string: "es")
            lblOtpVerifyTitle.text = "verifyCodeText".localizeString(string: "es")
            lblChooseCountryCode.text = "chooseCountryCode".localizeString(string: "es")
            lblEnterMobile.text = "enterMobileNumber".localizeString(string: "es")
            btnVerify.setTitle("verify".localizeString(string: "es"), for: .normal)
        }else{
            lblPhoneVerify.text = "phoneVerification".localizeString(string: "en")
            lblTitle.text = "phoneVerifyTitle".localizeString(string: "en")
            lblOtpVerifyTitle.text = "verifyCodeText".localizeString(string: "en")
            lblChooseCountryCode.text = "chooseCountryCode".localizeString(string: "en")
            lblEnterMobile.text = "enterMobileNumber".localizeString(string: "en")
            btnVerify.setTitle("verify".localizeString(string: "en"), for: .normal)
          
        }
       
    }
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: CPVCountry) {

    }
    func searchBarPosition(in countryPickerView: CountryPickerView) -> SearchBarPosition {
        return.tableViewHeader
    }
    func sectionTitleLabelFont(in countryPickerView: CountryPickerView) -> UIFont {
        return UIFont.boldSystemFont(ofSize: 17)
    }
//    func cellImageViewSize(in countryPickerView: CountryPickerView) -> CGSize {
//        return CGSize(width: 35, height: 25)
//    }
//    func showCountryCodeInList(in countryPickerView: CountryPickerView) -> Bool {
//        return true
//    }
//    func showCheckmarkInList(in countryPickerView: CountryPickerView) -> Bool {
//        return true
//    }
//    func localeForCountryNameInList(in countryPickerView: CountryPickerView) -> Locale {
//        return Locale.current
//    }

    @IBAction func verifyButton(_ sender: Any) {
        if numberTextFeild.text == "" {
            InternetErrorToast(view: self.view, message: "Enter phone number")
        }else{
           
            verifyNumberApi()
        }
    
            }
    
    func verifyNumberApi() {
        viewmodel.mobileVerificationApi(mobile: numberTextFeild.text ?? "", token: newVar) { data in
            let vc = self.storyboard?.instantiateViewController(identifier: "OtpVerificationVC") as! OtpVerificationVC
            vc.newToken = self.newVar
            vc.reToken = self.newVar
            vc.newId = self.idNew
            self.navigationController?.present(vc, animated: true, completion: nil)
        }
    }
   
    
}
    
