//
//  DataFetcherService.swift
//  MovieChooser
//
//  Created by Lyubov Menshikova on 18.05.2022.
//

import Foundation

class DataFetcherService {
    
    
    let apiKey = "23ce90c3f65e4e8490e85e17e1a20b9a"
    
    var dataFetcher: DataFetcher!
    static let sharedInstance = DataFetcherService()
    
    private init(dataFetcher: DataFetcher = NetworkDataFetcher()){
        self.dataFetcher = dataFetcher
    }
    
   
    func fetchNews (for category: String, completion: @escaping (News?) -> Void) {
        let url = "https://newsapi.org/v2/top-headlines?country=ru&category=\(category)&apiKey=\(apiKey)"
        dataFetcher.fetchGenericJSONData(urlString: url, response: completion)
    }
    
    
    
    
}
