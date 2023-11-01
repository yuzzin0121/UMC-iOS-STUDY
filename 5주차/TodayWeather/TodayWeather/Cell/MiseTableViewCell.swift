//
//  MiseTableViewCell.swift
//  TodayWeather
//
//  Created by 조유진 on 2023/11/01.
//

import UIKit

class MiseTableViewCell: UITableViewCell {

    @IBOutlet weak var stationName: UILabel!
    @IBOutlet weak var so2Value: UILabel!
    @IBOutlet weak var coValue: UILabel!
    @IBOutlet weak var o3Value: UILabel!
    @IBOutlet weak var no2Value: UILabel!
    @IBOutlet weak var pm10Value: UILabel!
    @IBOutlet weak var pm25Value: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
