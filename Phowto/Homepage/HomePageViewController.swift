//
//  ViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//

import UIKit

class HomePageViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    var contents : [Content] = [
        Content(image: "man.jpg", name: "asda"),
        Content(image: "man.jpg", name: "asda"),
        Content(image: "man.jpg", name: "asda")
    ]
    var button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.setTitle("dududu", for: .normal)
        
        return btn
    }()
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        carouselCollectionView.delegate = self
        
        carouselCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentView", for: indexPath)as? CollectionViewCell
        else{
            fatalError()
        }
        
        cell.display(image: UIImage(named: contents[indexPath.row].image!)!, buttonTitle: contents[indexPath.row].name!)
        
        
        return cell
        
    }

}

