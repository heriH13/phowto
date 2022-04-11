//
//  WatchVisualViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//

import Foundation
import UIKit

class WatchVisualViewController : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var btnTry: UIButton!
    @IBOutlet weak var openPage: UIButton!
    
    var imageData : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnTry.addTarget(self, action: #selector(buttonPressed(_: )), for: .touchUpInside)
        openPage.addTarget(self, action: #selector(openPagePressed(_: )), for: .touchUpInside)
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
//        self.performSegue(withIdentifier: "tesCompareSB", sender: nil) v
        print(image.size)
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let destination = segue.destination as? TesCompareVC
//            else {
//                return
//        }
//
//        destination.imageData = imageData
//    }
    
}
