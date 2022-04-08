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
    
    var dataDisplayed: Content? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        if let data = dataDisplayed {
            contentImage.image = UIImage(named: data.image ?? "")
            contentButton.setTitle(data.name, for: .normal)
        }
    }
    
}
