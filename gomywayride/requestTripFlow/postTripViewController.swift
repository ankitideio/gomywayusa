//
//  postTripViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 10/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class postTripViewController: UIViewController {
    
    var titleLblArr = ["Post a Trip","Find a Ride","Post a Request"]
    var ImageArr = [UIImage(named: "driverIcon"),UIImage(named: "passenger"),UIImage(named: "passenger")]
    var arrAbout = ["You're driving and have empty seats in your car you're looking to fill.","Find a trip as a passenger.","You're looking for a ride and would like to get notified when one is posted."]
    var titleLblFrenchArr = ["Publicar un Viaje","Encontrar un Viaje","Publicar una Solicitud"]
    var arrAboutFrench = ["Estás conduciendo y tienes asientos vacíos en tu coche que deseas ocupar.","Encuentra un viaje como pasajero.","Estás buscando un viaje y te gustaría recibir notificaciones cuando se publique uno."]
    var profileStatus = 0
    var viewModel = MoreDetailsVM()
    var viewModelTrip = FindTripVM()
    var tripId = "0"
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        getProfiledataApi()
       
    }
    func getProfiledataApi(){
        viewModel.getProfileApi(status: true) { data in
            
          self.profileStatus = data?.user?.profileStatus ?? 0
//            self.tripId = data?.upcomingTrips?[0].tripID ?? ""
        }
    }
   
    //MARK: - IBACtion
    func getTripRequestStatusApi()  {
//        viewModelTrip.getTripRequestStatusApi(token: fethToken(), tripId: tripId) { data in
//            self.passToNextVC(IDStr: "requestLoadWebViewController")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "requestLoadWebViewController") as! requestLoadWebViewController
//                vc.trip_id = data?.viewTrip?.tripID ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }

    @IBAction func back_btn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func continueTap(sender:UIButton)  {
        if sender.tag == 0 {
            getTripRequestStatusApi()
        }else if sender.tag == 1{
            passToNextVC(IDStr: "postRequestViewController")
        }else{
            passToNextVC(IDStr: "RequestPostVC")
             
        }
        
    }

}


extension postTripViewController: UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "es" {
     
            return titleLblFrenchArr.count
        }else{
            return titleLblArr.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! postTripTableCell
        cell.continuBtn.tag = indexPath.row
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "es" {
            cell.title_lbl.text = titleLblFrenchArr[indexPath.row]
            cell.lblAbout.text = arrAboutFrench[indexPath.row]
            cell.continuBtn.setTitle("continue".localizeString(string: "es"), for: .normal)
        }else{
            cell.title_lbl.text = titleLblArr[indexPath.row]
            cell.lblAbout.text = arrAbout[indexPath.row]
            cell.continuBtn.setTitle("Continue".localizeString(string: "en"), for: .normal)
        }
        
        
        cell.itemImage.image = ImageArr[indexPath.row]

        cell.continuBtn.addTarget(self, action: #selector(continueTap), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if profileStatus == 1{
            if indexPath.row == 0 {
                getTripRequestStatusApi()
            }else if indexPath.row == 1{
                passToNextVC(IDStr: "postRequestViewController")
            }else{
                passToNextVC(IDStr: "RequestPostVC")
            }
        }else{
            TostErrorMessage(view: self.view, message: "Please complete your profile")
        }
       
    }
    
}
