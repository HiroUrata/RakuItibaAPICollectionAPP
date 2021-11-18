//
//  ViewController.swift
//  RakuItibaAPICollectionAPP
//
//  Created by UrataHiroki on 2021/11/17.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    
    @IBOutlet weak var resultCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    private var cellContentsArray = [ItemResultDetailModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        resultCollectionView.register(UINib(nibName: "ResultItemListCell", bundle: nil), forCellWithReuseIdentifier: "ItemDetailCell")
        
        resultCollectionView.dataSource = self
        
    }


}

extension ViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cellContentsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

