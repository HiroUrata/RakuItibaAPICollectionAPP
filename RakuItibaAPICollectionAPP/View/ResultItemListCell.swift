//
//  ResultItemListCell.swift
//  RakuItibaAPICollectionAPP
//
//  Created by UrataHiroki on 2021/11/17.
//

import UIKit

class ResultItemListCell: UICollectionViewCell {

    
    @IBOutlet weak var mediumImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var shopNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        mediumImageView.image = UIImage(named: "")
        itemNameLabel.text = ""
        itemPriceLabel.text = ""
        shopNameLabel.text = ""
    }
}
