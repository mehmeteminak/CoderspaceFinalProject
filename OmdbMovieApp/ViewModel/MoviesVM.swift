//
//  MoviesVM.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 5.11.2023.
//

import Foundation


final class MoviesVM {
    
    var movies : [Movie] = []
    
    weak var delegate : MovieDelegate?
    
    func fetchMovies(searchedText : String = "batman"){
        
        movies.removeAll()
        
        let request = NetworkService.generateRequest(queryParameters: ["s":searchedText,"apikey" : Constants.apiKey]) as URLRequest
        
        NetworkService.request(request: request, decodingType: MovieSearchResult.self) { res in
            switch res {
            case .success(let decodedModel):
                guard let fetchedMovies = decodedModel.movies ,  decodedModel.error == nil else {
                    self.delegate?.movieNotFound()
                    return
                }
                self.movies = fetchedMovies
                self.delegate?.moviesFetched()
                
            case .failure(let failure):
                self.delegate?.presentAlert(message: failure.localizedDescription)
            }
        }
    }
}
