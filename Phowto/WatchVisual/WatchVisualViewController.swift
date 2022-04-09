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
    @IBOutlet weak var tesImgView: UIImageView!
    
    @IBOutlet weak var nextViewBtn: UIView!
    @IBOutlet weak var prevViewBtn: UIView!
    
    var cameraGrid : UIView!
    
    var currModule = 0
    var nextModule = 0
    let nextSt = "next"
    let prevSt = "prev"
    
    let assetArray = ["Asset 14", "Asset 15", "Asset 16"]
    //****
    var imageData : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewBtn()
        setupGesture()
        
        tesImgView.image = UIImage.init(named: assetArray[0])
        nextModule = 1
        openPage.addTarget(self, action: #selector(openPagePressed(_: )), for: .touchUpInside)
    }
    
    func setUpViewBtn(){
        prevViewBtn.translatesAutoresizingMaskIntoConstraints = false
        prevViewBtn.frame =  CGRect(x: 0, y: 0 , width: UIScreen.main.bounds.width / 2, height: 500)
//        prevViewBtn.backgroundColor = .blue
        
        nextViewBtn.translatesAutoresizingMaskIntoConstraints = false
        nextViewBtn.frame =  CGRect(x: UIScreen.main.bounds.width / 2, y: 0 , width: UIScreen.main.bounds.width / 2, height: 500)
//        nextViewBtn.backgroundColor = .red
    }
    
    func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WatchVisualViewController.tryTapped(gesture:)))
        let nextTouch = UITapGestureRecognizer(target: self, action: #selector(nextModule(_:)))
        let prevTouch = UITapGestureRecognizer(target: self, action: #selector(prevModule(_:)))
        prevViewBtn.addGestureRecognizer(prevTouch)
        nextViewBtn.addGestureRecognizer(nextTouch)
        btnTry.addGestureRecognizer(tapGesture)
        btnTry.isUserInteractionEnabled = true
    }
    
    @objc func  prevModule(_ sender : UIButton){
        if currModule > assetArray.startIndex {
            currModule -= 1
            animateImage(currModule, prevSt)
        } else {
            print("************ HIT THE FIRST INDEX")
        }
    }
    
    @objc func nextModule(_ sender : UIButton){
        if currModule < assetArray.count-1 {
            currModule += 1
            animateImage(currModule, nextSt)
        } else {
            print("************ HIT THE LAST INDEX")
        }
    }
    
    func animateImage(_ currModule: Int, _ nextOrPrev : String){
        if nextOrPrev == nextSt {
            UIView.transition(with: self.tesImgView,
                              duration: 0.8,
                              options: .transitionFlipFromRight,
                              animations: {
                self.tesImgView.image = UIImage.init(named: self.assetArray[currModule])
            }, completion: nil)
        } else {
            UIView.transition(with: self.tesImgView,
                              duration: 0.8,
                              options: .transitionFlipFromLeft,
                              animations: {
                self.tesImgView.image = UIImage.init(named: self.assetArray[currModule])
            }, completion: nil)
        }
    }
    
    @objc func tryTapped(gesture: UIGestureRecognizer) {
        cameraGrid = UIView()
        if gesture.view is UIImageView {
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.showsCameraControls = true
    //        vc.allowsEditing = true
            vc.delegate = self
//            vc.cameraOverlayView = self.addOverlay()
            present(vc, animated: true)
            }
    }
    
    func addOverlay() -> UIView? {
//        self.addLine(cameraGrid)
        self.addGridView(cameraView: cameraGrid)
        cameraGrid.frame = self.view.frame
        return cameraGrid
    }
    
//    func addLine(_ cameraView: UIView){
//        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), cornerRadius: 0)
//        path.usesEvenOddFillRule = true
//        let line = CGRect(x: 200, y: 0.0, width: UIScreen.main.bounds.width, height: 500)
//
//        let fillLayer = CAShapeLayer()
//        fillLayer.path = path.cgPath
//        fillLayer.fillRule = .evenOdd
//        fillLayer.opacity = 0.7
//
//        cameraView.layer.addSublayer(fillLayer)
////        cameraView.draw(line)
////        cameraGrid.backgroundColor = .red
//    }
    
    func addGridView(cameraView: UIView) {
     let horizontalMargin = cameraView.bounds.size.width / 4
     let verticalMargin = cameraView.bounds.size.height / 4

     let gridView = GridView()
         gridView.translatesAutoresizingMaskIntoConstraints = false
         cameraView.addSubview(gridView)
         gridView.backgroundColor = UIColor.clear
         gridView.leftAnchor.constraint(equalTo: cameraView.leftAnchor, constant: horizontalMargin).isActive = true
         gridView.rightAnchor.constraint(equalTo: cameraView.rightAnchor, constant: -1 * horizontalMargin).isActive = true
         gridView.topAnchor.constraint(equalTo: cameraView.topAnchor, constant: verticalMargin).isActive = true
         gridView.bottomAnchor.constraint(equalTo: cameraView.bottomAnchor, constant: -1 * verticalMargin).isActive = true
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
        
        guard let a = imageData else { print("******* NO IMAGE TO BE SAVED")
            return }
//        saveImage(imageData!)
        saveImage(a)
        self.performSegue(withIdentifier: "segueCompare", sender: nil)
    }
    
    func navigateNext() async {
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
        print(image.size)
    }
    
    func saveImage(_ image: UIImage){
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? TesCompareVC
            else {
                return
        }
        destination.modalPresentationStyle = .fullScreen
        destination.imageData = imageData
    }
}
