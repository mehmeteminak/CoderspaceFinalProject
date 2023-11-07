//
//  MovieDetailVM.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 6.11.2023.
//

import Foundation


class MovieDetailVM {

    weak var delegate : MovieDetailDelegate?
    
    var movieDetail : MovieDetail? 
    
    
    func fetchMovieDetail(id : String){
        let request = NetworkService.generateRequest(queryParameters: [
            "i" : id,
            "apikey" : Constants.apiKey
        ]) as URLRequest
        
        NetworkService.request(request: request, decodingType: MovieDetail.self) { res in
            switch res {
            case .success(let movieDetail):
                self.movieDetail = movieDetail
                self.delegate?.updateUIWithMovieDetail()
            case .failure(let error):
                self.delegate?.presentAlert(message: error.localizedDescription)
            }
        }
    }
    
    
}
