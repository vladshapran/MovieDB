//
//  Model.swift
//  test
//
//  Created by Vladislav Shapran on 30.11.2020.
//

import Foundation
// MARK: - Welcome


struct Result: Codable {
    let page: Int
    let total_pages: Int
    let results: [Movie]
}

struct Movie: Codable {
    
    let backdrop_path: String?
    let original_title: String
    let overview: String
    let release_date: String
    let genre_ids: [Int]
    
}


