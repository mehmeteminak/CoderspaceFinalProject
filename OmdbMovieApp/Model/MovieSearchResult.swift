//
//  SearchModel.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 5.11.2023.
//

import Foundation


// MARK: - MovieSearchResult
struct MovieSearchResult: Codable {
    let movies: [Movie]?
    let totalResults, response: String?
    let error: String?

    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case totalResults
        case response = "Response"
        case error = "Error"
    }
}

// MARK: - Search
struct Movie: Codable {
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}
