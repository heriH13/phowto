//
//  TesCompareVC.swift
//  Phowto
//
//  Created by heri hermawan on 07/04/22.
//

import Foundation
import UIKit

class TesCompareVC : UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageData : UIImage?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    public init(image: UIImage) {
            super.init(nibName: nil, bundle: nil)
            self.imageData = image
        }
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageData
        print("********** COMPARE OPENED")
    }
    
}
