//
//  SecondViewController.swift
//  hw2month3
//
//  Created by Александр Калашников on 14/7/22.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var prodName: [String] = []
    var prodPrice: [Int] = []
    
    var finalyPrice: Int = 0

    let tableView = UITableView()
    
    var totalPrice = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(totalPrice)
        totalPrice.translatesAutoresizingMaskIntoConstraints = false
        totalPrice.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        totalPrice.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        totalPrice.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        totalPrice.heightAnchor.constraint(equalToConstant: 70).isActive = true
        totalPrice.backgroundColor = .systemGray5
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.clipsToBounds = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Magazine", style: .plain, target: self, action: #selector(goToMagazine))
        
        view.backgroundColor = .lightGray
        title = "Total price"
        // Do any additional setup after loading the view.
        
        for i in prodPrice {
            finalyPrice += i
        }
        
        totalPrice.text = String(finalyPrice)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prodName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Product:\(prodName[indexPath.row]), price:\(prodPrice[indexPath.row])"
        return cell
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    @objc func goToMagazine() {
        dismiss(animated: true, completion: nil)
    }
}
