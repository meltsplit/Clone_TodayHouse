//
//  CollectionViewCell.swift
//  Clone_TodayHouse
//
//  Created by 장석우 on 2022/06/10.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(data: ProductData){
        imageView.image = data.setProductImage()
        productLabel.text = data.productName
    }

}
