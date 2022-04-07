//
//  CollectionViewCell.swift
//  Phowto
//
//  Created by Ricky on 07/04/22.
//

import UIKit



class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contentImage: UIImageView!
    
    
    @IBOutlet weak var contentButton: UIButton!
    
    func display(image: UIImage,
                 buttonTitle: String) {
        contentImage.image = image
        contentButton.setTitle(buttonTitle, for: .normal)
        
    }
    
    
    
}
