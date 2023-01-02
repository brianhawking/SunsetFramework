//
//  ViewController.swift
//  Demo
//
//  Created by Brian Veitch on 12/23/22.
//

import UIKit
import Sunset

class MenuViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var menuItems:[String] = [
        "Animations",
        "AlertViews"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "Home"
        navigationController?.navigationBar.setNeedsLayout()
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItemCell")
        
        cell?.textLabel?.text = menuItems[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch menuItems[indexPath.row] {
        case "AlertViews":
            performSegue(withIdentifier: "toC1AlertView", sender: nil)
        case "Animations":
            performSegue(withIdentifier: "toUIViewAnimations", sender: nil)
        default:
            break
        }
    }
    
    
}

