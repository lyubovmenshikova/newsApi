//
//  NewsTableViewController.swift
//  News-App
//
//  Created by Lyubov Menshikova on 12.06.2022.
//

import UIKit

class NewsTableViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var categories = Category.getCategories()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    func moveOnURL(url: String) {
        UIApplication.shared.open(URL(string: url)! as URL, options: [:], completionHandler: nil  )
    }
    
}

//MARK: UITableViewDataSource, UITableViewDelegate
extension NewsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        let category = categories[indexPath.row].name
        cell.categoryNameLabel.text = category.capitalizingFirstLetter()
       
        DataFetcherService.sharedInstance.fetchNews(for: category) { news in
            guard let news = news else { return }
            cell.news = news.articles
        }
        
        cell.didSelectClosure = { url in
            guard let url = url else { return }
            self.moveOnURL(url: url)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        340
    }
    
    

}
