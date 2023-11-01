//
//  MiseRepo.swift
//  TodayWeather
//
//  Created by 조유진 on 2023/11/01.
//

import Foundation

class MiseRepo {
    static let shared = MiseRepo()
    var data: [AirQualityItem] = []
}
