//
//  Category.swift
//  News-App
//
//  Created by Lyubov Menshikova on 15.06.2022.
//

import Foundation
import UIKit

struct Category {
    var name: String
}

extension Category {
    static func getCategories() -> [Category] {
        return [
            Category(name: "business"),
            Category(name: "entertainment"),
            Category(name: "general"),
            Category(name: "health"),
            Category(name: "science"),
            Category(name: "sports"),
            Category(name: "technology")
        ]
    }
}
