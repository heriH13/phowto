//
//  TileCollectionViewCell.swift
//  Phowto
//
//  Created by Ricky on 07/04/22.
//

import UIKit


struct TileCollectionViewCellViewModel{
    let name: String
    let backgroundColor: UIColor
}
class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    
    func configure(with viewModel : TileCollectionViewCellViewModel){
        contentView.backgroundColor = viewModel.backgroundColor
    }
}
