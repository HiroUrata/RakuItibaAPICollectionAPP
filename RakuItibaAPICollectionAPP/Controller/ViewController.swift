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
    
    private let alamofireProcess = AlamofireProcess()
    private let cellLayout = UICollectionViewFlowLayout()
    private var cellContentsArray = [ItemResultDetailModel]()
    
    private var judgeChangeViewPointYBool = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.addTarget(self, action: #selector(checkText), for: .valueChanged)
        
        resultCollectionView.register(UINib(nibName: "ResultItemListCell", bundle: nil), forCellWithReuseIdentifier: "ItemDetailCell")
        resultCollectionView.dataSource = self
        resultCollectionView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        cellLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        resultCollectionView.collectionViewLayout = cellLayout
    }

    @IBAction func search(_ sender: UIButton) {
        
        alamofireProcess.getItemDetailData(searchKey: searchTextField.text) { result, error in
            
            if error != nil{
                
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[self] in
                
                cellContentsArray = result!
                resultCollectionView.reloadData()
            }
        }
    }
    
    
    
}

extension ViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cellContentsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemDetailCell", for: indexPath) as! ResultItemListCell
        
        cell.mediumImageView.sd_setImage(with: URL(string: cellContentsArray[indexPath.row].mediumImageUrl!), completed: nil)
        cell.itemNameLabel.text = cellContentsArray[indexPath.row].itemName
        cell.itemPriceLabel.text = String(cellContentsArray[indexPath.row].itemPrice!)
        cell.shopNameLabel.text = cellContentsArray[indexPath.row].shopName
        
        return cell
    }
    
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.height / 2 - 10)
    }
}

//五等分の花嫁
