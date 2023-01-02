//
//  ViewController.swift
//  Sunset
//
//  Created by Brian Veitch on 11/22/22.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    var menuItems: [SingleItem] = []
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addTableView()
        addMenuItem()
    }
    
    func addTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Padding.medium),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Padding.medium),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    func addMenuItem() {
        menuItems.append(SingleItem(title: "TableViewCells", viewController: TableViewCellsViewController()))
        menuItems.append(SingleItem(title: "TableViewCell Animations", viewController: nil))
        menuItems.append(SingleItem(title: "Loading Indicators", viewController: nil))
        menuItems.append(SingleItem(title: "Basic Themes", viewController: nil))
    }
}

extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
        cell.textLabel?.text = menuItems[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = menuItems[indexPath.row].viewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

