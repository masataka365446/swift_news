//
//  NewsAnalytics.swift
//  NewApiApp
//
//  Created by 福原雅隆 on 2021/10/25.
//

import Foundation
//リクエスト
import Alamofire
//解析
import SwiftyJSON
import PKHUD

protocol DoneCatchContentsProtocol{
    func doneCatchContents(newsContentsArray:[NewsContentsModel])
}


class NewsAnalytics{
    
    //JSON解析をするクラス M
    
    var urlString = String()
    var newsContentArray = [NewsContentsModel]()
    var doneCatchContentsProtocol:DoneCatchContentsProtocol?
    var titleArray = ["","business","entertainment","technology"]
    
    func start(segmentNumber:Int){
        HUD.show(.progress)
        
        if segmentNumber == 0{
            urlString = "https://newsapi.org/v2/top-headlines?country=jp&apikey=19ac5c53d0bb497a872378bca901beec"
        }else{
            urlString = "https://newsapi.org/v2/top-headlines?country=jp&category=\(titleArray[segmentNumber])&apikey=19ac5c53d0bb497a872378bca901beec"
        }
        
        
    
        
        let encoderUrlString:String = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        AF.request(encoderUrlString, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result{
            case .success:
                do {
                    let json:JSON = try JSON(data:response.data!)
                    print(json.debugDescription)
                    let totalResults = json["totalResults"].int
                    self.newsContentArray = []
                    
                    for i in 0...totalResults! - 1{
                        
                        print(i)
                        //値が入っているか検証
                        if let author = json["articles"][i]["author"].string,let title = json["articles"][i]["title"].string,let description = json["articles"][i]["description"].string,let url = json["articles"][i]["url"].string,let urlToImage = json["articles"][i]["urlToImage"].string,let publishedAt = json["articles"][i]["publishedAt"].string{
                            
                            let newsContentModel = NewsContentsModel(author: author, title: title, description: description, url: url, urlImage: urlToImage, publishedAt: publishedAt)
                            
                            self.newsContentArray.append(newsContentModel)
                            
                        }
                    }
                    
                    self.doneCatchContentsProtocol?.doneCatchContents(newsContentsArray: self.newsContentArray)
                    
                    HUD.hide()
                    
                }catch{}
                
                
            case .failure(_):
                print("失敗")
            }
        }
        
    }
    
}
