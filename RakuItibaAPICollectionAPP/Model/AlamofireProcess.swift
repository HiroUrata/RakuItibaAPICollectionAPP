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
                
                print(getdata)
                
                for dataCount in 0..<30{
                    
                    if let getMediumImageUrl = getdata["Items"][dataCount]["Item"]["mediumImageUrls"][0]["imageUrl"].string,
                       let getItemName = getdata["Items"][dataCount]["Item"]["itemName"].string,
                       let getItemPrice = getdata["Items"][dataCount]["Item"]["itemPrice"].int,
                       let getShopName =  getdata["Items"][dataCount]["Item"]["shopName"].string{
                        
                        print(getMediumImageUrl)
                        print(getItemName)
                        print(getItemPrice)
                        print(getShopName)
                        
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

extension String{

    var urlEncoded:String{

        let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
        let remove = removingPercentEncoding ?? self

        return remove.addingPercentEncoding(withAllowedCharacters: charset) ?? remove
    }
}
