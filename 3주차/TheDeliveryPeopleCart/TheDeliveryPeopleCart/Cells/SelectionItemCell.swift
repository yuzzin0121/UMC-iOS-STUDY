//
//  SelectionItemCell.swift
//  TheDeliveryPeopleCart
//
//  Created by 조유진 on 2023/10/04.
//

import UIKit

class SelectionItemCell: UITableViewCell {
    static let identifier = "SelectionItemCell"
    
    private let contentsView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "체크동글")
        
        
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
    
    private let checkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "+0원"
        label.font = UIFont.systemFont(ofSize: 17)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        addSubview(contentsView)
        contentsView.addSubview(checkStackView)
        [checkImage, selectionMenuLabel].map {
            checkStackView.addArrangedSubview($0)
        }
        addSubview(totalStackView)
        [checkStackView, priceLabel].map {
            totalStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            contentsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentsView.topAnchor.constraint(equalTo: topAnchor),
            contentsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            totalStackView.topAnchor.constraint(equalTo: contentsView.topAnchor, constant: 12),
            totalStackView.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 18),
            totalStackView.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -18),
            totalStackView.bottomAnchor.constraint(equalTo: contentsView.bottomAnchor, constant: -12)
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
