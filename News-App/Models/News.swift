//
//  News.swift
//  News-App
//
//  Created by Lyubov Menshikova on 13.06.2022.
//

import Foundation

struct News: Decodable {
    let articles: [Articles]
}

struct Articles: Decodable {
    let title: String
    let urlToImage: String?
    let url: String?
    let publishedAt: String?
}
