//
//  HomePageViewController.swift
//  Phowto
//
//  Created by heri hermawan on 06/04/22.
//

import Foundation
import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
        private let tableView: UITableView = {
        let table = UITableView()


        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()

    private let viewModels: [CollectionTableViewCellViewModel] = [
        
        CollectionTableViewCellViewModel(
            viewModels: [
                TileCollectionViewCellViewModel(name: "Apple", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Apple1", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Apple2", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Apple3", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Apple4", backgroundColor: .systemBlue)
            ]
        )
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
         
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let viewModel = viewModels[indexPath.row]
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath)as? CollectionTableViewCell
        else{
            fatalError()
        }
        cell.configure(with: viewModel)
//        cell.textLabel?.text="Hello word"
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/2
    }
    
    
}
