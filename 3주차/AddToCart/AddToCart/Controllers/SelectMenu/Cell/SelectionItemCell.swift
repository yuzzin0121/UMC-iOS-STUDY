//
//  SelectionItemCell.swift
//  AddToCart
//
//  Created by 조유진 on 2023/10/09.
//

import UIKit

class SelectionItemCell: UITableViewCell {
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var selectionMenuLabel: UILabel!
    @IBOutlet weak var addPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
