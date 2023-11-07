//
//  MovieDetailDelegate.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 6.11.2023.
//

import Foundation


protocol MovieDetailDelegate : AnyObject {
    func updateUIWithMovieDetail()
    func presentAlert(message : String)
}
