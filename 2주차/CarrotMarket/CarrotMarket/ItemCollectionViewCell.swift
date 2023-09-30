//
//  ItemCollectionViewCell.swift
//  CarrotMarket
//
//  Created by 조유진 on 2023/09/28.
//

import UIKit

final class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "HorizonItemCell"
    // 상품 이미지
    let itemImageView: UIImageView = {
        let itemImageView = UIImageView()
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        return itemImageView
    }()
    
    // 제목
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = ""
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 11)
//        titleLabel.setLineSpacing(spacing: 25.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    // 가격
    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.boldSystemFont(ofSize: 12)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [itemImageView, titleLabel, priceLabel].map {
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            itemImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 120),
            itemImageView.heightAnchor.constraint(equalToConstant: 120),
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
//            titleLabel.widthAnchor.constraint(equalToConstant: itemImageView.width),
            titleLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.leadingAnchor, constant: 2),
            titleLabel.trailingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: -2)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
        ])
        
        self.itemImageView.layer.cornerRadius = 8
        self.itemImageView.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.setCell(item: nil)
    }
    
    func setCell(item: CollectionItem?) {
        itemImageView.image = item?.getItemImage()!
        titleLabel.text = item?.title!
    
        if (item?.price == "") {
            priceLabel.text = ""
        }
        else {
            priceLabel.text = "\(item?.price ?? "")원"
        }
        
    }
}
