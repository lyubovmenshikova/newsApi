//
//  NewsTableViewCell.swift
//  News-App
//
//  Created by Lyubov Menshikova on 16.06.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var categoryNameLabel: UILabel!
    
    var news: [Articles]? {
        didSet {
            collectionView.reloadData()
        }
    }
    var didSelectClosure: ((_ url: String?) -> Void)?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension NewsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
        cell.newsTitleLabel.text = news?[indexPath.row].title
        
        DispatchQueue.global().async {
            if let imageData = ImageManager.shared.fetchImageData(from: self.news?[indexPath.row].urlToImage) {
                DispatchQueue.main.async {
                    cell.newsImage.image = UIImage(data: imageData)
                }

            }
        }
        cell.setUpAppearence()
        cell.setUpGradientView()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectClosure?(news?[indexPath.row].url)
    }
    
    
}
