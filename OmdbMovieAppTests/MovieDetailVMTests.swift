//
//  MovieDetailVM.swift
//  OmdbMovieAppTests
//
//  Created by Macbook Air on 7.11.2023.
//

import XCTest

@testable import OmdbMovieApp

final class MovieDetailVMTests : XCTestCase {

    
    var movieDetailVM : MovieDetailVM?
    
    override func setUpWithError() throws {
        movieDetailVM = MovieDetailVM()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchingMovieDetail() throws {
        
       
        movieDetailVM!.fetchMovieDetail(id: "tt0944947")
        
        sleep(5)
        XCTAssertNotNil(movieDetailVM!.movieDetail)
        
    }

}
