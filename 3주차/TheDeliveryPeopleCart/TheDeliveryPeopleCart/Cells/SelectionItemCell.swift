//
//  SelectionItemCell.swift
//  TheDeliveryPeopleCart
//
//  Created by 조유진 on 2023/10/04.
//

import UIKit

class SelectionItemCell: UITableViewCell {
    static let identifier = "SelectionItemCell"
    
    private let checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "체크동글")
        image.contentMode = .scaleAspectFit
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private let selectionMenuLabel: UILabel = {
        let label = UILabel()
        label.text = "엽기떡볶이"
        label.font = UIFont.systemFont(ofSize: 18)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "+0원"
        label.font = UIFont.systemFont(ofSize: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(checkImage)
        addSubview(selectionMenuLabel)
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            checkImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            checkImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            checkImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 26),
            checkImage.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        NSLayoutConstraint.activate([
            selectionMenuLabel.centerYAnchor.constraint(equalTo: checkImage.centerYAnchor),
            selectionMenuLabel.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: 14),
            selectionMenuLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -14)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: checkImage.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.setData(item: nil)
    }
    
    func setData(item: SelectionItem?) {
        guard let item = item else {
            return
        }
        print("메뉴이름:\(item.selectionMenu)")
        checkImage.image = item.checkImage
        selectionMenuLabel.text = item.selectionMenu
        priceLabel.text = item.priceValue
    }

}
