//
//  SingleLabelWithButtonViewController.swift
//  Sunset
//
//  Created by Brian Veitch on 11/23/22.
//

import UIKit

// This is an example of how to insert a ready to go tableView
// Follow steps from ReadyToGoTableViewControllers/SingleLabelTableViewController

/*
 This tableview controller is for a simple single labeled cell. After getting the tableview Controller set up, you just need to add the elements to the items array
 
 Steps to use:
 
 1. Initialize SingleLabelTableViewController() in your ViewController, ex. tableViewController = SingleLabelTableViewController()
 2. Add it to your VC using
        - addChild(tableViewController)
        - view.addSubview(tableViewController.view) or whateverUIView.addSubview(...)
        - tableViewController.didMove(toParent: self)
 3. Just add objects to the items array
        tableViewController.items = ...
 4. You can create an extension in your ViewController for the rest of the tableview functions
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("SELECTED ROW \(indexPath.row)")
        }
*/

class SingleLabelWithButtonViewController: UIViewController {

    var tableViewController = SingleLabelTableViewController(hideAction: false)
    
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
    
    func getData() -> [SingleItem] {
        let rows = [
            SingleItem(title: "Food", viewController: nil),
            SingleItem(title: "Activities", viewController: SingleLabelDestinationViewController())
        ]
        
        return rows
    }
    

}
