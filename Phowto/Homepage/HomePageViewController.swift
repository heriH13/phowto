//
//  ViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//

import UIKit

class HomePageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    \
    @IBOutlet weak var coba_saja: UILabel!
    var thisWidth:CGFloat = 0
    var contents : [Content] = [
        Content(image: "Module 02", name: "Learn about Bokeh", id: "1"),
        Content(image: "Module 03", name: "Understanding Composition", id: "2"),
        Content(image: "Module 08", name: "Well exposed Images ", id: "3")
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
    
    
    @IBAction func chooseModule(_ sender: Any) {
//        performSegue(withIdentifier: "goToAlternateStoryboard", sender: self)
        
        
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
