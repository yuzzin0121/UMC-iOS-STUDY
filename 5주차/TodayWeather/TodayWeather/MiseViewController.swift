//
//  MiseViewController.swift
//  TodayWeather
//
//  Created by 조유진 on 2023/11/01.
//

import UIKit

class MiseViewController: UIViewController{
    
    @IBOutlet weak var sidoName: UILabel!
    @IBOutlet weak var miseTableView: UITableView!
  
    var items: [AirQualityItem] = []
 
    var sidoNameValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseTableView.dataSource = self
        miseTableView.delegate = self
        miseTableView.reloadData()
        
        miseTableView.register(UINib(nibName: "MiseTableViewCell", bundle: nil), forCellReuseIdentifier: "MiseTableViewCell")
        NotificationCenter.default.addObserver(self,  selector: #selector(didRecieveTestNotification(_:)), name: NSNotification.Name("receiveNotification"), object: nil)

        
        self.sidoName.text = sidoNameValue
        MiseAPI.shared.getMise(sidoName: sidoNameValue)
    }
    
    
    @objc func didRecieveTestNotification(_ notification: Notification) {
        items = MiseRepo.shared.data
        miseTableView.reloadData()
    }
}


extension MiseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = miseTableView.dequeueReusableCell(withIdentifier: "MiseTableViewCell", for: indexPath) as! MiseTableViewCell
        
        cell.stationName.text = items[indexPath.row].stationName ?? ""
        cell.so2Value.text = items[indexPath.row].so2Value ?? ""
        cell.coValue.text = items[indexPath.row].coValue ?? ""
        cell.o3Value.text = items[indexPath.row].o3Value ?? ""
        cell.no2Value.text = items[indexPath.row].no2Value ?? ""
        cell.pm10Value.text = items[indexPath.row].pm10Value ?? ""
        cell.pm25Value.text = items[indexPath.row].pm25Value ?? ""

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        238.0
    }
}
