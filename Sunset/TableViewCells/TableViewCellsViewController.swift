//
//  TableViewCellsViewController.swift
//  Sunset
//
//  Created by Brian Veitch on 11/22/22.
//

import UIKit

class TableViewCellsViewController: UIViewController {
    
    let tableViewController = SingleLabelTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.backgroundColor
        setupTableView()
    }
    
    func setupTableView() {
        addChild(tableViewController)
        view.addSubview(tableViewController.view)
        tableViewController.didMove(toParent: self)
        
        // add data to tableview
        tableViewController.rows = [
            SingleItem(title: "Single Label w/wo Action", viewController: SingleLabelWithButtonViewController()),
            SingleItem(title: "Sinle Label With Image + Button", viewController: SingleLabelWithImageViewController_Example()),
            SingleItem(title: "3", viewController: nil),
            SingleItem(title: "4", viewController: nil),
            SingleItem(title: "9", viewController: nil),
            SingleItem(title: "1", viewController: nil),
            SingleItem(title: "2", viewController: nil),
            SingleItem(title: "3", viewController: nil),
            SingleItem(title: "4", viewController: nil),
            SingleItem(title: "9", viewController: nil),
            SingleItem(title: "1", viewController: nil),
            SingleItem(title: "2", viewController: nil),
            SingleItem(title: "3", viewController: nil),
            SingleItem(title: "4", viewController: nil),
            SingleItem(title: "9", viewController: nil),
        ]
        
        // use this to reload when neccessary
        tableViewController.reloadData()
    }
}

// if you wanted to add additional tableview functions, do it here
extension SingleLabelTableViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = rows[indexPath.row].viewController else { return }
        vc.view.backgroundColor = Color.backgroundColor
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
