//
//  SingleLabelWithImageViewController.swift
//  Sunset
//
//  Created by Brian Veitch on 11/23/22.
//

import UIKit

/*
 This tableview controller is for a simple single labeled cell. After getting the tableview Controller set up, you just need to add the elements to the items array
 
 Steps to use:
 
 1. Add your custome UITableView's reuseIdentifer and class name (line 32)
 1. Initialize SingleLabelTableViewController() in your ViewController, ex. tableViewController = SingleLabelTableViewController()
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

class SingleLabelWithImageViewController: UIViewController {
    
    // ADD THE reuseIdentifer string here
    // Then go to line 83 to add the UITableView's class name
    let identifier = "SingleLabelWithImageTableViewCell"
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var rows: [SingleLabelWithImage] = []
    var hideAction: Bool?
    
    init(hideAction: Bool? = true) {
        self.hideAction = hideAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setBackgroundColor(with color: UIColor?) {
        view.backgroundColor = Color.backgroundColor
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    private func setupTableView() {
        
        
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)

        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Padding.medium),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Padding.medium),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Padding.medium),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: Padding.medium)
        ])
    }
}

extension SingleLabelWithImageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SingleLabelWithImageTableViewCell
        cell.title.text = rows[indexPath.row].title
        cell.singleImage.image = rows[indexPath.row].image
        if let hideAction = hideAction {
            cell.actionButton.isHidden = hideAction
        }
        return cell
    }
    
    
}

