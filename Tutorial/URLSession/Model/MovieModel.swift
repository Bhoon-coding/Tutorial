//
//  MovieModel.swift
//  Tutorial
//
//  Created by BH on 2022/03/16.
//

import Foundation

// MARK: MovieModel

struct MovieModel: Codable {
    let items: [Movie]
}

// MARK: Movie

struct Movie: Codable {
    let title, subtitle: String
    let link: String
    let image: String
    let director, actor: String
    let pubDate, userRating: String
}

