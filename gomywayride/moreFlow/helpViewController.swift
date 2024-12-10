//
//  helpViewController.swift
//  gomywayride
//
//  Created by Snow-Macmini-1 on 06/09/19.
//  Copyright © 2019 Snow-Macmini-1. All rights reserved.
//

import UIKit

class helpViewController: UIViewController {
    
    @IBOutlet weak var table_view: UITableView!
    
    var helpArr = NSArray()
    var viewModel = MoreDetailsVM()
    var arrHelp = [[String:Any]]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        if  UserDefaults.standard.string(forKey: "selectLanguage") == "es" {
       
            self.title = "help".localizeString(string: "es")
        }else{
            self.title = "help".localizeString(string: "en")
           
        }
        table_view.ShadowColorView()
        
        table_view.tableFooterView = UIView(frame: .zero)
        

      helpDataApi()
    }
    
    func helpDataApi()  {
        viewModel.helpApi { data in
            self.arrHelp.removeAll()
            if data?.count ?? 0 > 0{
                for i in data ?? [] {
                    if  UserDefaults.standard.string(forKey: "selectLanguage") == "es" {
                   
                        self.arrHelp.append(["title":i.title_spanish ?? "","description":i.description_spanish ?? ""])
                    }else{
                        self.arrHelp.append(["title":i.title ?? "","description":i.description ?? ""])
                       
                    }
                
                   
                }
                self.table_view.reloadData()
            }
        }
    }
   
}
extension helpViewController : UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHelp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! helptableViewCell
        let titleStr = arrHelp[indexPath.row]["title"] as? String ?? ""
        let descStr =  arrHelp[indexPath.row]["description"] as? String ?? ""
        
        cell.tital_lbl.text = "\u{2022} \(titleStr)".stripOutHtml()
        
        cell.descLabl.text = descStr.stripOutHtml()
        
        return cell
        
    }


    
}
