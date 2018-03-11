//
//  MyItemsViewController.swift
//  PCybernetics
//
//  Created by Daniel Smith on 3/11/18.
//  Copyright © 2018 Daniel Smith. All rights reserved.
//

import Foundation
import UIKit

class MyItemsViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    private let noItemsLabel = UILabel()
    
    private var hasItems: Bool
    {
        return !ClothingItem.getMyItems().isEmpty
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupNoItemsLabel()
        setupAddButton()
        setupView(hasItems: hasItems)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        setupView(hasItems: hasItems)
    }
    
    func setupView(hasItems: Bool)
    {
        tableView.isHidden = !hasItems
        noItemsLabel.isHidden = hasItems
    }
    
    private func setupNoItemsLabel()
    {
        noItemsLabel.text = "Add an item to see it here."
        noItemsLabel.sizeToFit()
        noItemsLabel.center = view.center
        view.addSubview(noItemsLabel)
    }

    private func setupAddButton()
    {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        navigationItem.setRightBarButton(addButton, animated: true)
    }
    
    @objc func addButtonPressed()
    {
        let vc = DonateViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}