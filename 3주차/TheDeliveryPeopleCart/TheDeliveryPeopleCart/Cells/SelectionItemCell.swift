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
        label.font = UIFont.systemFont(ofSize: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//
//    private let checkStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .fill
//        stackView.distribution = .equalSpacing
//        stackView.spacing = 12
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
    
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "+0원"
        label.font = UIFont.systemFont(ofSize: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private let totalStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.backgroundColor = .white
//        stackView.alignment = .fill
//        stackView.distribution = .equalSpacing
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    
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
//        addSubview(totalStackView)
//
//        totalStackView.addSubview(checkStackView)
//        [checkImage, selectionMenuLabel].map {
//            checkStackView.addArrangedSubview($0)
//        }
//        addSubview(totalStackView)
//        [checkStackView, priceLabel].map {
//            totalStackView.addArrangedSubview($0)
//        }
//
//
//        NSLayoutConstraint.activate([
//            totalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
//            totalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
//            totalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
//            totalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
//        ])
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(checkImage)
        addSubview(selectionMenuLabel)
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            checkImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 22),
            checkImage.heightAnchor.constraint(equalToConstant: 22)
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
