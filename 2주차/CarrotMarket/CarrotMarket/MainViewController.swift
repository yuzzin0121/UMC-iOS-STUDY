//
//  ViewController.swift
//  CarrotMarket
//
//  Created by 조유진 on 2023/09/27.
//

import UIKit

class MainViewController: UIViewController {
    private let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        return navigationBar
    }()
    
  
    // 상단 뷰
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = .white
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    // 위치 버튼
    private let locationButton: UIButton = {
        let locationButton = UIButton()
        
        let arrowDownImage = UIImage(named: "arrow_down")
        let imageSize = CGSize(width: 20, height: 20)
        let newImage = arrowDownImage?.resized(to: imageSize)
        locationButton.setImage(newImage, for: .normal)
        locationButton.setTitle("광명동 ", for: .normal)
        locationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(18))
        locationButton.setTitleColor(.black, for: .normal)
        locationButton.semanticContentAttribute = .forceRightToLeft
        locationButton.contentVerticalAlignment = .center
        locationButton.contentHorizontalAlignment = .center
        
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        return locationButton
    }()
    
    // 메뉴 버튼
    private let menu: UIButton = {      // 메뉴 아이콘
        let menu = UIButton()
        menu.tintColor = .black
        menu.setImage(UIImage(named: "메뉴"), for: .normal)
        menu.translatesAutoresizingMaskIntoConstraints = false
        return menu
    }()
    
    // 검색 버튼
    private let search: UIButton = {     // 알림 아이콘
        let search = UIButton()
        search.tintColor = .black
        search.setImage(UIImage(named: "검색"), for: .normal)
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    // 알림 버튼
    private let bell: UIButton = {      // 장바구니 아이콘
        let bell = UIButton()
        bell.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        bell.tintColor = .black
        bell.setImage(UIImage(named: "알림"), for: .normal)
        bell.translatesAutoresizingMaskIntoConstraints = false
        return bell
    }()

    // 테이블뷰
    private var tableView: UITableView = {
        let tableView = UITableView()

        tableView.backgroundColor = .black
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.identifier)
        tableView.register(ItemTableViewCellTwo.self, forCellReuseIdentifier: ItemTableViewCellTwo.identifier)
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
//    var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width), height: 140)
//
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .white
//        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
//        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        return collectionView
//    }()
    
    var items: [MyItem] = []
    
    let tableItems: [TableItem] = [
        TableItem(itemImageName: "img1", title: "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구함니다.^^ - 🧅", location: "당근알바", time: "이벤트", price: ""),
        TableItem(itemImageName: "img2", title: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", location: "서울특별시 양천구", time: "1일 전", price: "550,000"),
        TableItem(itemImageName: "img3", title: "에어팟 맥스 스페이스크레이 S급 판매합니다.", location: "서울특별시 양천구", time: "3시간 전", price: "490,000"),
        TableItem(itemImageName: "img4", title: "에어팟맥스실퍼", location: "서울특별시 양천구", time: "6일 전", price: "370,000"),
        TableItem(itemImageName: "img5", title: "애어팟 맥스 블랙 판매합니다", location: "광명동", time: "3일 전", price: "370,000")
    ]
    
    let collectionItems: [CollectionItem] = [
        CollectionItem(itemImageName: "img6", title: "스팸", price: "30,000"),
        CollectionItem(itemImageName: "img7", title: "스팸 8호", price: "24,000"),
        CollectionItem(itemImageName: "img8", title: "청정원 종합선물세트 특석2호 + 선물가방", price: "50,000"),
        CollectionItem(itemImageName: "img9", title: "신앙촌 간장 선물세트 판매합니다!", price: "27,000"),
        CollectionItem(itemImageName: "img10", title: "cj 스팸선물세트 + 선물가방", price: "27,000"),
        CollectionItem(itemImageName: "img11", title: "정관장 홍삼진건 세트+선물가방", price: "45,000"),
        CollectionItem(itemImageName: "img12", title: "스팸복합1호 2개 판매합니다", price: "34,000"),
        CollectionItem(itemImageName: "img13", title: "[새상품]오설록 프리미엄 티 컬렉션 티세트 선물세트", price: "45,000"),
        CollectionItem(itemImageName: "img14", title: "선물세트", price: "7,000")
    ]
    
    // 위치 버튼
    private let plusButton: UIButton = {
        let plusButton = UIButton()
        plusButton.backgroundColor = UIColor.orange
        plusButton.layoutMargins = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        let arrowDownImage = UIImage(systemName: "plus")
        let imageSize = CGSize(width: 20, height: 20)
        let newImage = arrowDownImage?.resized(to: imageSize)
        plusButton.setImage(newImage, for: .normal)
        plusButton.setTitle(" 글쓰기", for: .normal)
        plusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: CGFloat(18))
        plusButton.setTitleColor(.white, for: .normal)
        plusButton.contentVerticalAlignment = .center
        plusButton.contentHorizontalAlignment = .center
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        return plusButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubViews()
        setNavigationBar()
        setLayout()
        setCollectionViewLayout()
        tableView.dataSource = self
        
        setItemData()
        tableView.reloadData()
    }
    
    private func addSubViews() {
        view.addSubview(headerView)
        headerView.addSubview(locationButton)
        headerView.addSubview(menu)
        headerView.addSubview(search)
        headerView.addSubview(bell)
        
        view.addSubview(plusButton)
        view.addSubview(tableView)
//        tableView.bringSubviewToFront(plusButton)
    }
    
    private func setCollectionViewLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            tableView.widthAnchor.constraint(equalToConstant: self.view.width)
        ])
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalToConstant: self.view.width),
            headerView.heightAnchor.constraint(equalToConstant: self.view.height/7.8),
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        ])
        
        // 현재 주소 변경 버튼 설정
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -14),
            locationButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 18)
        ])
        
        // menu 아이콘 레이아웃 설정
        NSLayoutConstraint.activate([
            bell.widthAnchor.constraint(equalToConstant: 32),
            bell.heightAnchor.constraint(equalToConstant: 32),
            bell.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -14),
            bell.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10)
        ])
        
        // search 아이콘 레이아웃 설정
        NSLayoutConstraint.activate([
            search.widthAnchor.constraint(equalToConstant: 32),
            search.heightAnchor.constraint(equalToConstant: 32),
            search.trailingAnchor.constraint(equalTo: bell.leadingAnchor, constant: -8),
            search.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10)
        ])
        
        
        // bell 아이콘 레이아웃 설정
        NSLayoutConstraint.activate([
            menu.widthAnchor.constraint(equalToConstant: 32),
            menu.heightAnchor.constraint(equalToConstant: 32),
            menu.trailingAnchor.constraint(equalTo: search.leadingAnchor, constant: -8),
            menu.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
            plusButton.widthAnchor.constraint(equalToConstant: 100),
            plusButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func setNavigationBar() {
        self.navigationController?.setBackgroundColor()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: locationButton)

    }
    
    private func setItemData(){
        items.append(contentsOf:
            tableItems.prefix(3).map { MyItem.tableItem($0)}
        )
        items.append(.collectionItem(collectionItems))
        items.append(contentsOf:
            tableItems.dropFirst(3).map { MyItem.tableItem($0)}
        )
    }

}


extension UINavigationController {
    func setBackgroundColor() {
        navigationBar.barTintColor = UIColor.white
        navigationBar.isTranslucent = false
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if(indexPath.row != 2) {
//            guard let tableCell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell else {
//                return UITableViewCell()
//            }
//            print(indexPath.row)
//            tableCell.setCell(item: tableItems[indexPath.row])
//
//            return tableCell
//        }
//        else {
//            guard let tableCellTwo = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCellTwo.identifier, for: indexPath) as? ItemTableViewCellTwo else {
//                return UITableViewCell()
//            }
//            print(indexPath.row)
//            tableCellTwo.setCell(item: collectionItems)
//            return tableCellTwo
//        }
        switch self.items[indexPath.item] {
        case let .tableItem(tableItem):
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as! ItemTableViewCell
            cell.setCell(item: tableItem)
            return cell
        
        case let .collectionItem(collectionItems):
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCellTwo.identifier, for: indexPath) as! ItemTableViewCellTwo
            cell.setCell(item: collectionItems)
            return cell
        }
        
        
    }
    

    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if(indexPath.row == 5) {
//            return ItemTableViewCellTwo.cellHeight
//        }
//        else {
//            return UITableView.automaticDimension
//        }
        switch self.items[indexPath.item] {
        case .tableItem:
            print(UITableView.automaticDimension)
            return UITableView.automaticDimension
        case .collectionItem:
            print(ItemTableViewCellTwo.cellHeight)
            return UITableView.automaticDimension
        }
    }
}

