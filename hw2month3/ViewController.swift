//
//  ViewController.swift
//  hw2month3
//
//  Created by Александр Калашников on 14/7/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var productsCollection: [ProductsModule] = [
        ProductsModule(imageOfProduct: UIImage(named: "cheeseballs")!, nameOfProduct: "Cheese Balls", priceOfProduct: 130),
        ProductsModule(imageOfProduct: UIImage(named: "cocacola")!, nameOfProduct: "Coca Cola", priceOfProduct: 39),
        ProductsModule(imageOfProduct: UIImage(named: "creckers")!, nameOfProduct: "Creckers", priceOfProduct: 280),
        ProductsModule(imageOfProduct: UIImage(named: "eggs")!, nameOfProduct: "Eggs", priceOfProduct: 104),
        ProductsModule(imageOfProduct: UIImage(named: "flour")!, nameOfProduct: "Flour", priceOfProduct: 192),
        ProductsModule(imageOfProduct: UIImage(named: "lays")!, nameOfProduct: "Cheeps Lays", priceOfProduct: 124),
        ProductsModule(imageOfProduct: UIImage(named: "pikojuice")!, nameOfProduct: "Piko Juice", priceOfProduct: 114),
        ProductsModule(imageOfProduct: UIImage(named: "pringles")!, nameOfProduct: "Pringles", priceOfProduct: 234),
        ProductsModule(imageOfProduct: UIImage(named: "redbull")!, nameOfProduct: "RedBull", priceOfProduct: 189),
        ProductsModule(imageOfProduct: UIImage(named: "sprite")!, nameOfProduct: "Sprite", priceOfProduct: 39)
    ]
    
    var prName: [String] = []
    var prPrice: [Int] = []
    
    var collectionView: UICollectionView?
    
    var basketButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/2)-4,
                                 height: (view.frame.size.width/2)+54)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
        view.addSubview(basketButton)
        basketButton.translatesAutoresizingMaskIntoConstraints = false
        basketButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        basketButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        basketButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        basketButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        basketButton.setTitle("0", for: .normal)
        basketButton.backgroundColor = .systemBlue
        basketButton.layer.borderWidth = 1
        basketButton.layer.cornerRadius = 80/2
        basketButton.addTarget(self, action: #selector(goToFinalPrice), for: .touchUpInside)
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        
        print(indexPath.row)
        
        cell.configureImage(image: productsCollection[indexPath.row].imageOfProduct)
        cell.configureLabel(label: "\(productsCollection[indexPath.row].nameOfProduct) \(productsCollection[indexPath.row].priceOfProduct)")
        return cell
        
    }
    
    var prpr = 0
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        prName.append(productsCollection[indexPath.row].nameOfProduct)
        prPrice.append(productsCollection[indexPath.row].priceOfProduct)
        prpr += 1
        basketButton.setTitle(String(prpr), for: .normal)
        
    }
    
    @objc func goToFinalPrice() {
        let rootVC = SecondViewController()
        var prName = prName
        var prPrice = prPrice
        rootVC.prodName = prName
        rootVC.prodPrice = prPrice
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
         
        
        
        present(navVC, animated: false)
//        navigationController?.pushViewController(rootVC, animated: true)
    }

}

