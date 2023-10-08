//
//  SelectionTableViewCell.swift
//  TheDeliveryPeopleCart
//
//  Created by 조유진 on 2023/10/03.
//

import UIKit

class SelectionCell: UITableViewCell {
    static let identifier="SelectionCell"
    private let contentsView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let selectionNameLabel: UILabel = {
        let label = UILabel()
        label.text = "선택"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let selectConditionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 38, height: 22))
        label.text = "필수"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 13)
        label.backgroundColor = .buttonLiteBlue
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // 테이블뷰
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .buttonLiteBlue
        tableView.isScrollEnabled = false
        tableView.register(SelectionItemCell.self, forCellReuseIdentifier: SelectionItemCell.identifier)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // 구분선
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .buttonGray  // 원하는 색상으로 설정
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var selection: SelectionItemName?

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
        backgroundColor = .white
        self.tableView.dataSource = self
//        self.tableView.delegate = self
        addSubview(contentsView)
        [selectionNameLabel, selectConditionLabel].map {
            stackView.addArrangedSubview($0)
        }
        
        contentsView.addSubview(stackView)
        contentsView.addSubview(tableView)
        contentsView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: topAnchor),
            contentsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentsView.topAnchor, constant: 18),
            stackView.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor, constant: -18)
        ])
        
        stackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        stackView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            selectConditionLabel.widthAnchor.constraint(equalToConstant: 38),
            selectConditionLabel.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat((selection?.selectionItems.count ?? 1) * 54))
        ])
        
        
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 12),
            separatorView.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentsView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 12) // 원하는 두께로 설정
        ])
        tableView.reloadData()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.setData(item: nil)

    }
    
    func setData(item: SelectionItemName?) {
        guard let item = item else {
            print("아이템 없음")
            return
        }
        self.selection = item
        selectionNameLabel.text = item.selectionKind
        selectConditionLabel.text = item.isEssentialString
        
        if(item.isEssential) {  // 필수일 경우
            selectConditionLabel.backgroundColor = .buttonLiteBlue
            selectConditionLabel.textColor = .buttonTextBlue
        }
        else {
            selectConditionLabel.backgroundColor = .buttonGray
            selectConditionLabel.textColor = .buttonTextGray
        }
        
       
        print(item.selectionItems.count)
        
//        var totalHeight: CGFloat = 0
//        for section in 0..<tableView.numberOfSections {
//            totalHeight += CGFloat(tableView.numberOfRows(inSection: section)) * 60
//        }
//        tableView.heightAnchor.constraint(equalToConstant: totalHeight).isActive = true
//        tableView.estimatedRowHeight = CGFloat(item.selectionItems.count * 54)
//        tableView.heightAnchor.constraint(equalToConstant: CGFloat(item.selectionItems.count * 50)).isActive = true
        tableView.reloadData()
    }
    
}

extension SelectionCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let selectionItems = selection?.selectionItems else {
            return 0
        }
        return selectionItems.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectionItemCell.identifier, for: indexPath) as? SelectionItemCell else {
            return UITableViewCell()
        }
        print(indexPath.row)
        
        cell.setData(item: self.selection?.selectionItems[indexPath.row])
        
        return cell
    }
    
}

extension SelectionCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
