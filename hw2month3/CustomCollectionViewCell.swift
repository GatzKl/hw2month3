//
//  CustomCollectionViewCell.swift
//  hw2month3
//
//  Created by Александр Калашников on 14/7/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    let myLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Custom"
        return label
    }()
    
//    let myButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "basket"), for: .normal)
//        button.contentMode = .scaleAspectFit
//        button.clipsToBounds = true
//
//        return button
//    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)
//        contentView.addSubview(myButton)
//        myButton.addTarget(CustomCollectionViewCell.self, action: #selector(addToBasket), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        myLabel.frame = CGRect(x: 5,
                               y: contentView.frame.size.height-100,
                               width: contentView.frame.size.width-10,
                               height: 50)
        
        myImageView.frame = CGRect(x: 5,
                                   y: 0,
                                   width: contentView.frame.size.width-10,
                                   height: contentView.frame.size.height-100)
        
//        myButton.frame = CGRect(x: 35,
//                                y: contentView.frame.size.height-60,
//                                width: 50,
//                                height: 50)
    }
    
    
    func configureLabel(label: String) {
        myLabel.text = label
    }
    
    
    
    func configureImage(image: UIImage) {
        myImageView.image = image
    }
    
}
