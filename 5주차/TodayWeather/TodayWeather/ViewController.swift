//
//  ViewController.swift
//  TodayWeather
//
//  Created by 조유진 on 2023/11/01.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var sidotableView: UITableView!
    @IBOutlet weak var sidoSearchBar: UISearchBar!
    @IBOutlet weak var searchButton: UIButton!
    
    var sidoDatas: [String] = []
    var filterredArr: [String] = []
    var isFiltering: Bool = false
    var sendDelegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sidotableView.dataSource = self
        sidotableView.delegate = self
        sidoSearchBar.delegate = self
        sidoSearchBar.showsCancelButton = true
        sidotableView.register(SidoTableViewCell.self, forCellReuseIdentifier: "sidoCell")
        setSidoData()
    }

    // 검색했을 때
    @IBAction func didTapSearch(_ sender: UIButton) {
        
    }
    
    func setSidoData() {
        sidoDatas = Sido.allCases.map { $0.rawValue }
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    // 서치바에서 검색을 시작할 때 호출
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.isFiltering = true
        self.sidoSearchBar.showsCancelButton = true
        self.sidotableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterredArr = self.sidoDatas.filter { $0.localizedCaseInsensitiveContains(searchText) }
       
        self.sidotableView.reloadData()
    }
    
    
    // 서치바에서 검색버튼을 눌렀을 때 호출
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()

        self.sidotableView.reloadData()
    }
    
    // 서치바에서 취소 버튼을 눌렀을 때 호출
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.sidoSearchBar.text = ""
        self.sidoSearchBar.resignFirstResponder()
        self.isFiltering = false
        filterredArr = []
        self.sidotableView.reloadData()
    }
    
    
    // 서치바 검색이 끝났을 때 호출
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.sidotableView.reloadData()
    }
    
    // 서치바 키보드 내리기
    func dismissKeyboard() {
        sidoSearchBar.resignFirstResponder()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterredArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sidotableView.dequeueReusableCell(withIdentifier: "sidoCell", for: indexPath) as! SidoTableViewCell
        
        cell.label.text = filterredArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let miseVC = self.storyboard?.instantiateViewController(identifier: "MiseViewController") as? MiseViewController else {return}
        
        miseVC.sidoNameValue = filterredArr[indexPath.row]
        self.navigationController?.pushViewController(miseVC, animated: true)
    }
}

class SidoCell: UITableViewCell {
    @IBOutlet weak var sidoLabel: UILabel!
}
