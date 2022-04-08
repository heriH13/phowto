//
//  WatchVisualViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//

import Foundation
import UIKit

class WatchVisualViewController : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var btnTry: UIImageView!
    
    @IBOutlet weak var openPage: UIButton!
    //****
    @IBOutlet weak var tesBtn: UIButton!
    @IBOutlet weak var tesImgView: UIImageView!
    
    @IBOutlet weak var nextViewBtn: UIView!
    
    var currModule = 0
    var nextModule = 0
    
    let assetArray = ["Asset 14", "Asset 15", "Asset 16"]
    //****
    var imageData : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WatchVisualViewController.tryTapped(gesture:)))
        let tapTouch = UITapGestureRecognizer(target: self, action: #selector(tesNextModule(_:)))
        nextViewBtn.addGestureRecognizer(tapTouch)
        btnTry.addGestureRecognizer(tapGesture)
        btnTry.isUserInteractionEnabled = true
        tesImgView.image = UIImage.init(named: assetArray[0])
        nextModule = 1
        tesBtn.addTarget(self, action: #selector(tesNextModule(_: )), for: .touchUpInside)
        
        openPage.addTarget(self, action: #selector(openPagePressed(_: )), for: .touchUpInside)
    }
    
    @objc func tesNextModule(_ sender : UIButton){
        if nextModule < assetArray.count-1 {
            currModule = nextModule
            nextModule += 1
//            tesImgView.image = UIImage.init(named: assetArray[currModule])
            
            animateImage(currModule)
            
//            UIView.transition(with: self.tesImgView,
//                              duration: 1.0,
//                              options: .transitionFlipFromRight,
//                              animations: {
//                self.tesImgView.image = UIImage.init(named: self.assetArray[self.currModule])
//            }, completion: nil)
            
        } else {
            currModule = nextModule
//            tesImgView.image = UIImage.init(named: assetArray[currModule])
            nextModule = 0
            animateImage(currModule)
        }
    }
    
    func animateImage(_ currModule: Int){
        UIView.transition(with: self.tesImgView,
                          duration: 1.0,
                          options: .transitionFlipFromRight,
                          animations: {
            self.tesImgView.image = UIImage.init(named: self.assetArray[currModule])
        }, completion: nil)
    }
    
    @objc func tryTapped(gesture: UIGestureRecognizer) {
        if gesture.view is UIImageView {
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.showsCameraControls = true
    //        vc.allowsEditing = true
            vc.delegate = self
            present(vc, animated: true)
            }
    }
    
    @objc func buttonPressed(_ sender : UIButton){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.showsCameraControls = true
//        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func openPagePressed(_ sender : UIButton){
        self.performSegue(withIdentifier: "segueCompare", sender: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

//        guard let image = info[.editedImage] as? UIImage else {
//            print("No image found")
//            return
//        }
        
        guard let image = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        
        imageData = image
//        self.performSegue(withIdentifier: "tesCompareSB", sender: nil)
        print(image.size)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? TesCompareVC
            else {
                return
        }
        
        destination.imageData = imageData
    }
}
