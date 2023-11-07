//
//  MiseAPI.swift
//  TodayWeather
//
//  Created by 조유진 on 2023/11/01.
//

import Foundation
import Alamofire

class MiseAPI {
    static let shared = MiseAPI()
    let apiKey: String = "MQrVo83BfzepcyVuUlKNaG571858FLI1mA1dL%2BTSqKOaFlPBclqkCUqXjL4y7iixgRx7BFUi4BhxcT2UnN2Wbg%3D%3D"
    
    func getMise(sidoName: String) {
        
        let decoder = JSONDecoder()
        
        print("getMise")
        
        guard let encodedSidoName = sidoName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            print("encode 안됨")
            return
        }
        
        let url = "https://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=\(apiKey)&returnType=json&numOfRows=4&pageNo=1&sidoName=\(encodedSidoName)&ver=1.0"
        
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default)
        .responseJSON{ response in
            switch response.result{
            case .success:
                let jsonData = response.data!
                
                if let miseData = try? decoder.decode(MiseResponse.self, from: jsonData){
                    MiseRepo.shared.data = miseData.response.body.items
                }
                NotificationCenter.default.post(name: Notification.Name("receiveNotification"), object: nil)
            
            case .failure(let err):
                print("error:\(err)")
                
            }
        }
    }
}
