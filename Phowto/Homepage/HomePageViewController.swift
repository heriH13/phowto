//
//  ViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var thisWidth:CGFloat = 0
    var contents : [Content] = [
        Content(image: "man", name: "ini gambar nomor 1"),
        Content(image: "man", name: "2"),
        Content(image: "man", name: "3")
    ]
 
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var carouselPageControl: UIPageControl!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        carouselCollectionView.delegate = self
        
        carouselCollectionView.dataSource = self
       
       carouselPageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
    
        // Do any additional setup after loading the view.
    }

        
    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        carouselCollectionView.setContentOffset(CGPoint(x: CGFloat(current) * carouselCollectionView.frame.size.width, y: 0), animated: true)
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
    
    func testing(_ collection: UICollectionView){
        let test = collection.frame.size.width
        
        let test2 = collection.contentSize.width
        
        let test3 = collection.contentOffset.x
        if(test3 + test == test2){
            print("test2")
        }
    }
    
    

//    func colle
}


//extension HomePageViewController: UICollectionViewDelegate, UIScrollViewDelegate{
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView){
//        carouselPageControl.currentPage = Int(floorf(Float(collectionView.contentOffset.x) / Float(carouselView.frame.size.width)))
//    }
//
//}
