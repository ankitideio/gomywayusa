//
//  BankDetailVC.swift
//  GomywayCanada
//
//  Created by meet sharma on 04/08/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import UIKit

class BankDetailVC: UIViewController {
    
    @IBOutlet weak var txtFldAccountNumber: UITextField!
    @IBOutlet weak var txtFldBankName: UITextField!
    @IBOutlet weak var txtFldName: UITextField!
    var pickerVwBank = UIPickerView()
    var arrBankList = [BankListModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bank Detail"
        txtFldBankName.delegate = self
        txtFldBankName.inputView = pickerVwBank
//        getBankDetail()
//        getBankList()
    }
//    func getBankList(){
//        let param = ["token":fethToken()]
//        APIManager().postDatatoServer(bankListApi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            let dataDict = result?["data"]  as? NSArray ?? []
//            
//            if status == true
//            {
//                
//                for dataStates in dataDict
//                {
//                    
//                    let dataItems = BankListModel.init(data: dataStates as! [String : Any])
//                    self.arrBankList.append(dataItems)
//                }
//                
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//    }
//    
//    func getBankDetail(){
//        let param = ["token":fethToken()]
//        APIManager().postDatatoServer(getBankDetailApi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            let dataDict = result?["data"]  as? NSDictionary ?? [:]
//            
//            if status == true
//            {
//
//                self.txtFldName.text = dataDict["bank_user_name"] as? String ?? ""
//                self.txtFldBankName.text = dataDict["bank_name"] as? String ?? ""
//                self.txtFldAccountNumber.text = dataDict["account_number"] as? String ?? ""
//                
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//    }
//    
//    func addBankDetail(){
//        
//        let param = ["token":fethToken(),"account_number":txtFldAccountNumber.text ?? "","bank_user_name":txtFldName.text ?? "","bank_name":txtFldBankName.text ?? ""]
//        APIManager().postDatatoServer(addBankDetailApi_endpoint, parameter: param as NSDictionary, success: { (response) in
//            print(response)
//            
//            let result = response.dictionaryObject
//            let messageStr = result?["message"] as? String ?? ""
//            let status = result?["status"] as? Bool ?? false
//            let dataDict = result?["data"]  as? NSArray ?? []
//            
//            if status == true
//            {
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
//                vc.modalPresentationStyle = .overFullScreen
//                self.navigationController?.present(vc, animated: true)
//               
//            
//            }
//            else
//            {
//                TostErrorMessage(view: self.view, message: messageStr)
//            }
//            
//            
//        }) { (error) in
//            TostErrorMessage(view: self.view, message: error.localizedDescription)
//        }
//    }
    @IBAction func actionSave(_ sender: UIButton) {
//        addBankDetail()
        
    }
    
}

extension BankDetailVC:UIPickerViewDataSource,UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerVwBank{
            return arrBankList.count
        }else{
            return 0
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == pickerVwBank{
            return arrBankList[row].name ?? ""
        }else{
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == pickerVwBank{
            txtFldBankName.text =  arrBankList[row].name ?? ""
        }
    }
}
extension BankDetailVC:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtFldBankName{
            pickerVwBank.dataSource = self
            pickerVwBank.delegate = self
            pickerVwBank.reloadAllComponents()
            if txtFldBankName.inputView == pickerVwBank{
                let row = pickerVwBank.selectedRow(inComponent:0)
                txtFldBankName.text = arrBankList[row].name ?? ""
                
            }
        }
    }
    
}
