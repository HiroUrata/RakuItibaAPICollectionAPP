//
//  AlamofireProcess.swift
//  RakuItibaAPICollectionAPP
//
//  Created by UrataHiroki on 2021/11/18.
//

import Alamofire
import SwiftyJSON

class AlamofireProcess{
    
    private var ResultDetailDatas = [ItemResultDetailModel]()
}

extension AlamofireProcess{
    
    public func getItemDetailData(searchKey:String?,completion:@escaping([ItemResultDetailModel]?,Error?) -> Void){
        
        guard let key = searchKey else { return }
        
        let apiKey = ""
        
    }
}
