//
//  ItemTableViewCell.swift
//  CarrotMarket
//
//  Created by 조유진 on 2023/09/29.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    static let identifier = "itemCell"
    let itemImageView: UIImageView = {
        let itemImageView = UIImageView()
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        return itemImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.setLineSpacing(spacing: 25.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        locationLabel.textColor = .secondaryLabel
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        return locationLabel
    }()
    
    let timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = .secondaryLabel
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        return timeLabel
    }()
    
    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [itemImageView, titleLabel, locationLabel, timeLabel, priceLabel].map {
            addSubview($0)
        }
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            itemImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 124),
            itemImageView.heightAnchor.constraint(equalToConstant: 124)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: itemImageView.topAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 20),
            locationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 0),
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 20),
            priceLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 10)
        ])
        
        self.itemImageView.layer.cornerRadius = 8
        self.itemImageView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(item: TableItem) {
        itemImageView.image = item.getItemImage()
        titleLabel.text = item.title
        locationLabel.text = item.location
        timeLabel.text = "• \(item.time!)"
        
        if (item.price == "") {
            priceLabel.text = ""
        }
        else {
            priceLabel.text = "\(item.price!)원"
        }
        
    }
}
