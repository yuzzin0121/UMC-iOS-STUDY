//
//  Mise.swift
//  TodayWeather
//
//  Created by 조유진 on 2023/11/01.
//

import Foundation

import Foundation

struct MiseResponse: Codable {
    let response: Response
}

struct Response: Codable {
    let body: Body
    let header: Header
}

struct Body: Codable {
    let totalCount: Int
    let items: [AirQualityItem]
    let pageNo: Int
    let numOfRows: Int
}

struct AirQualityItem: Codable {
    let so2Value: String?
    let coValue: String?
    let pm10Value: String?
    let pm25Value: String?
//    let sidoName: String?
    let no2Value: String?
    let stationName: String?
    let o3Value: String?
}

struct Header: Codable {
    let resultMsg: String
    let resultCode: String
}
