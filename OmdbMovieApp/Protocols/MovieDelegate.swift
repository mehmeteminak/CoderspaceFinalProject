//
//  MovieDelegate.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 5.11.2023.
//

import Foundation


protocol MovieDelegate : AnyObject {
    func moviesFetched()
    func presentAlert(message : String)
    func movieNotFound()
}
