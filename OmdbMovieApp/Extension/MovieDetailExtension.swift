//
//  MovieDetailExtension.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 6.11.2023.
//

import UIKit


extension MovieDetailVC : MovieDetailDelegate {
    
    func updateUIWithMovieDetail() {
        
        if let movieDetail = viewModel.movieDetail {
            setLabelTexts(with: movieDetail)
        }
    }
    
    func presentAlert(message: String) {
        let alert = UIAlertController(title: "HATA!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "TAMAM", style: .default))
        present(alert, animated: true)
    }
    
    func movieDetailInitialConfig(){
        
        viewModel.delegate = self
        movieDetailStackView.addArrangedSubview(movieTitleLabel)
        movieDetailStackView.addArrangedSubview(movieYearLabel)
        movieDetailStackView.addArrangedSubview(movieCastLabel)
        movieDetailStackView.addArrangedSubview(moviePlaceLabel)
        movieDetailStackView.addArrangedSubview(movieDirectorLabel)
        movieDetailStackView.addArrangedSubview(movieIMDBRating)
        view.addSubviews([moviePosterView,movieDetailStackView])

    }
    
    func setLayouts(){
        NSLayoutConstraint.activate([
            moviePosterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            moviePosterView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 40),
            moviePosterView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -40),
            moviePosterView.heightAnchor.constraint(equalToConstant: Constants.deviceHeight * 0.5),
            
            movieDetailStackView.topAnchor.constraint(equalTo: moviePosterView.bottomAnchor,constant: 20),
            movieDetailStackView.leftAnchor.constraint(equalTo: moviePosterView.leftAnchor),
            movieDetailStackView.rightAnchor.constraint(equalTo: moviePosterView.rightAnchor),
            movieDetailStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)

        ])
    }
    
    func setLabelTexts(with movieDetail : MovieDetail){
        DispatchQueue.main.async { [weak self] in
            guard let self else {  return  }
            
            self.movieYearLabel.text = movieDetail.year
            self.movieCastLabel.text = movieDetail.actors
            self.movieIMDBRating.text = movieDetail.imdbRating
            self.moviePlaceLabel.text = movieDetail.country
            self.movieTitleLabel.text = movieDetail.title
            self.movieDirectorLabel.text = movieDetail.director
            
            if let moviePosterURLString = movieDetail.poster {
                self.moviePosterView.kf.setImage(with: URL(string: moviePosterURLString))
            }
        }
    }
}

 
