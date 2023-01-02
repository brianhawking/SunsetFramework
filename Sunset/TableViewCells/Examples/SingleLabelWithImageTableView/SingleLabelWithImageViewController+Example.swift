//
//  SingleLabelWithImageViewController+Example.swift
//  Sunset
//
//  Created by Brian Veitch on 11/23/22.
//

import UIKit

/*
 This tableview controller is for a simple single labeled cell. After getting the tableview Controller set up, you just need to add the elements to the items array
 
 Steps to use:
 
 1. Add your custome UITableView's reuseIdentifer and class name (line 32)
 1. Initialize SingleLabelWithImageViewController() in your ViewController, ex. tableViewController = SingleLabelTableViewController()
 2. Add it to your VC using
        - addChild(tableViewController)
        - view.addSubview(tableViewController.view)
        - tableViewController.didMove(toParent: self)
 3. Just add objects to the items array
        tableViewController.items = ...
 4. You can create an extension in your ViewController for the rest of the tableview functions
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("SELECTED ROW \(indexPath.row)")
        }
*/

class SingleLabelWithImageViewController_Example: UIViewController {
    
    let tableViewController = SingleLabelWithImageViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
        tableViewController.rows = getData()
    }
    
    func addTableView() {
        addChild(tableViewController)
        view.addSubview(tableViewController.view)
        tableViewController.didMove(toParent: self)
    }
    
    func getData() -> [SingleLabelWithImage] {
        let rows = [
            SingleLabelWithImage(title: "Food", image: UIImage(systemName: "book.fill")!, viewController: nil),
            SingleLabelWithImage(title: "Activities", image: UIImage(systemName: "power.circle.fill")!, viewController: nil)
        ]
        return rows
    }
}

extension SingleLabelWithImageViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("I SELECTED row \(indexPath.row)")
    }
}
