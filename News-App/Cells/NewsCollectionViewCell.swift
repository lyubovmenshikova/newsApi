//
//  NewsCollectionViewCell.swift
//  News-App
//
//  Created by Lyubov Menshikova on 16.06.2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var newsTitleLabel: UILabel!
    @IBOutlet var collectionView: UIView!
   
    let view = UIView()
    let gradient = CAGradientLayer()
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImage.image = nil
    }
    
    func setUpAppearence() {
        collectionView.layer.shadowOpacity = 0.2
        collectionView.layer.shadowColor = UIColor.gray.cgColor
        collectionView.layer.shadowRadius = 2
        newsImage.layer.cornerRadius = 15
        collectionView.layer.cornerRadius = 15
        
    }
    
    func setUpGradientView() {
        view.frame = contentView.bounds
        gradient.frame = view.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.1]
        gradient.shouldRasterize = true
        gradient.rasterizationScale = UIScreen.main.scale
        view.layer.insertSublayer(gradient, at: 0)
        newsImage.insertSubview(view, at: 0)
        newsImage.bringSubviewToFront(view)
    }
    
  
}
