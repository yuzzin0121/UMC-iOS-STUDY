//
//  SelectionCell.swift
//  AddToCart
//
//  Created by 조유진 on 2023/10/09.
//

import UIKit

class SelectionCell: UITableViewCell {
    @IBOutlet weak var selectionNameLabel: UILabel!
    @IBOutlet weak var selectConditionLabel: UILabel!
    @IBOutlet weak var itemTableView: UITableView!
    
    var selection: Selection?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectConditionLabel.layer.cornerRadius = 10
        selectConditionLabel.clipsToBounds = true
        
        itemTableView.delegate = self
        itemTableView.dataSource = self
        
        let itemNib = UINib(nibName: "SelectionItemCell", bundle: nil)
        itemTableView.register(itemNib, forCellReuseIdentifier: "SelectionItemCell")
        
        itemTableView.reloadData()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}

extension SelectionCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = selection?.selectionItems?.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = itemTableView.dequeueReusableCell(withIdentifier: "SelectionItemCell", for: indexPath) as? SelectionItemCell else {
            return UITableViewCell()
        }
        
        cell.checkImage.image = selection?.selectionItems?[indexPath.row].checkImage
        cell.selectionMenuLabel.text = selection?.selectionItems?[indexPath.row].selectionMenu
        cell.addPriceLabel.text = selection?.selectionItems?[indexPath.row].priceValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
