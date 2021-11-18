//
//  AlamofireProcess.swift
//  RakuItibaAPICollectionAPP
//
//  Created by UrataHiroki on 2021/11/18.
//

import Alamofire
import SwiftyJSON

class AlamofireProcess{
    
    private var resultDetailDatas = [ItemResultDetailModel]()
}

extension AlamofireProcess{
    
    public func getItemDetailData(searchKey:String?,completion:@escaping([ItemResultDetailModel]?,Error?) -> Void){
        
        guard let key = searchKey else { return }
        
        let apiKey = ""
        
        AF.request(apiKey, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {[self] response in
            
            switch response.result{
                
            case .success:
                
                let getdata = JSON(response.data as Any)
                resultDetailDatas = []
                
                for dataCount in 0..<getdata["Items"].count{
                    
                    if let getMediumImageUrl = getdata["Items"][dataCount]["Item"]["mediumImageUrls"][0].string,
                       let getItemName = getdata["Items"][dataCount]["Item"]["itemName"].string,
                       let getItemPrice = getdata["Items"][dataCount]["Item"]["itemPrice"].int,
                       let getShopName =  getdata["Items"][dataCount]["shopName"].string{
                        
                        resultDetailDatas.append(ItemResultDetailModel(mediumImageUrl: getMediumImageUrl,
                                                                       itemName: getItemName,
                                                                       itemPrice: getItemPrice,
                                                                       shopName: getShopName))
                    }
                    
                }
                completion(resultDetailDatas, nil)
                
            case .failure(let error):
                
                completion(nil, error)
            }
        }
        
    }
}
