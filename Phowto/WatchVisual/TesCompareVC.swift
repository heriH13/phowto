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
    
    @IBOutlet weak var backBtn: UIButton!
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
        setUpBackButton()
    }
    
    func setUpBackButton(){
        backBtn.setImage(UIImage.init(systemName: "chevron.left"), for: .normal)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backBtn.addTarget(self, action: #selector(backBtnPressed(_:)), for: .touchUpInside)
    }
    
    @objc func backBtnPressed(_ sender : UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
}
