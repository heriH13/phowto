//
//  SelectedModuleViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//
import UIKit

class SelectedModuleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    
    @IBOutlet weak var subModuleImage: UIImageView!
    var subModuleCount: Int = 0
    var database: Content?
    var testImage : UIImage?
    @IBOutlet weak var subModuleTable: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        subModuleTable.delegate = self
        subModuleTable.dataSource = self
        subModuleImage.image = testImage
//        subModuleImage.image = UIImage(named: database!.name!)
        
        
    }
    public init(image: UIImage) {
                super.init(nibName: nil, bundle: nil)
                self.testImage = image
            }
        
        required init?(coder: NSCoder) {
                super.init(coder: coder)
            }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return database!.SubModule.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubmoduleCell") as! SubModuleViewCell
            
            // Ambil title kategori dari array berdasarkan index item
//        let title = database!.SubModule[indexPath.row].subModuleName
//
//            // Set data title ke labelTitle
//
//        cell.subModuleName.text = title
//        if(subModuleCount > indexPath.row){
//            cell.subModuleProgress.backgroundColor = .green
//        }else{
//            cell.subModuleProgress.backgroundColor = .red
//        }
        return cell
    }
    


}
