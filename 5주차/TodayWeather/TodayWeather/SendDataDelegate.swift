//
//  SendDataDelegate.swift
//  TodayWeather
//
//  Created by 조유진 on 2023/11/01.
//

import Foundation

protocol SendDataDelegate {
    func recieveDataAndGetSido(sidoName: String) -> Void
}
