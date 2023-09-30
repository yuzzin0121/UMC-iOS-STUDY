//
//  ItemTableViewCellTwo.swift
//  CarrotMarket
//
//  Created by 조유진 on 2023/09/29.
//

import UIKit

final class ItemTableViewCellTwo: UITableViewCell {
    static let identifier = "itemCellTwo"
    static let cellHeight = 180.0
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "우리동네 한가위 선물세트 🌕"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
    
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let goButton: UIButton = {
        let goButton = UIButton()
        goButton.tintColor = .black
        goButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        goButton.translatesAutoresizingMaskIntoConstraints = false
        return goButton
    }()
    
//    let scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.backgroundColor = .white
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        return scrollView
//    }()
    
//    let scrollContentView: UIView = {
//        let scrollContentView = UIView()
//        scrollContentView.backgroundColor = .white
//        scrollContentView.translatesAutoresizingMaskIntoConstraints = false
//        return scrollContentView
//    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (120), height: 195)
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = true
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    var collectionItems = [CollectionItem](){
        didSet {
            collectionView.reloadData()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        self.collectionItems = []
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.collectionView.dataSource = self
        
        [titleLabel, goButton, collectionView].map {
            contentView.addSubview($0)
        }
//        scrollView.addSubview(scrollContentView)
//        scrollView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12)
        ])
        NSLayoutConstraint.activate([
            goButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            goButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            goButton.widthAnchor.constraint(equalToConstant: 24),
            goButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
//        NSLayoutConstraint.activate([
//            scrollView.widthAnchor.constraint(equalToConstant: contentView.width),
//            scrollView.heightAnchor.constraint(equalToConstant: 140),
//            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
//            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
        
//        scrollView.contentSize = CGSize(width: contentView.width, height: contentView.height)
        
//        NSLayoutConstraint.activate([
//            scrollContentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
//            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
//            scrollContentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
//            scrollContentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)
//        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 12),
            collectionView.widthAnchor.constraint(equalToConstant: contentView.width),
            collectionView.heightAnchor.constraint(equalToConstant: 195)
        ])
//        self.collectionItems = []
        collectionView.reloadData()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.setCell(item: [])
    }
    
    func setCell(item: [CollectionItem]) {
        self.collectionItems = item
        self.collectionView.reloadData()
    }
}

extension ItemTableViewCellTwo : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.collectionItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
//        collectionItems.map{
//            print($0.price ?? "없음")
//        }
//        print(collectionItems[indexPath.row])
        cell.setCell(item: collectionItems[indexPath.row])

        return cell
    }
}
