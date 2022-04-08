//
//  ViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//

import UIKit

class HomePageViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var thisWidth:CGFloat = 0
    var contents : [Content] = [
        Content(image: "man", name: "ini gambar nomor 1"),
        Content(image: "man", name: "2"),
        Content(image: "man", name: "3")
    ]
 
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var carouselPageControl: UIPageControl!
    var thisWidth:CGFloat = 0
   override func viewDidLoad() {
        super.viewDidLoad()
        carouselCollectionView.delegate = self
        
        carouselCollectionView.dataSource = self
      

        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentView", for: indexPath) as? CollectionViewCell
        else{
            fatalError()
        }
        
//        let img: UIImage = UIImage(named: (contents[indexPath.row].image!))!
        
        cell.dataDisplayed = contents[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionViewCell, at indexPath: IndexPath) {
        self.carouselPageControl.currentPage = indexPath.section
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        thisWidth = CGFloat(self.frame.width)
        
        return CGSize(width: thisWidth, height: self.frame.height)
    }
//    func colle
}

