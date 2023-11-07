//
//  OmdbMovieAppTests.swift
//  OmdbMovieAppTests
//
//  Created by Macbook Air on 5.11.2023.
//

import XCTest
@testable import OmdbMovieApp

final class OmdbMovieAppTests: XCTestCase {
    
    var viewModel : MoviesVM?
    var searchedText : String?
    var mockSearchResult : MovieSearchResult?

    override func setUpWithError() throws {
        
        continueAfterFailure = true
        
        viewModel = MoviesVM()
        searchedText = "batman"
        mockSearchResult = MovieSearchResult(movies: [Movie(title: "batman", year: "2018", imdbID: "tt6579", type: .movie, poster: "....")], totalResults: "13", response: "true", error: "false")
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    
    func testFetchMovies() throws {
        
        viewModel?.fetchMovies()
        
        //We are waiting in here because this fetch movies function is taking a while
        sleep(5)
        XCTAssertFalse(viewModel!.movies.isEmpty)
         
    }
    
    
    func testRequestCreated(){
        let request = NetworkService.generateRequest(queryParameters: ["apikey":Constants.apiKey])
        
        XCTAssertNotNil(request)
        XCTAssertEqual(request.url?.query,"apikey=\(Constants.apiKey)")
    }
    
    

}
