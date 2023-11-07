//
//  MoviesVCExtension.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 5.11.2023.
//

import UIKit


extension MoviesVC {
    func initialConfig(){
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        viewModel.delegate = self
        moviesTableView.register(MovieTVC.self, forCellReuseIdentifier: "movieTVC")
        view.addSubviews([moviesTableView,moviesSearchBar,movieNotFoundLabel])
        
    }
    
    func setLayouts(){
        NSLayoutConstraint.activate([
            moviesSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            moviesSearchBar.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 20),
            moviesSearchBar.rightAnchor.constraint(equalTo: view.rightAnchor , constant: -20),
            
            moviesTableView.topAnchor.constraint(equalTo: moviesSearchBar.bottomAnchor,constant: 15),
            moviesTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            moviesTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            movieNotFoundLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieNotFoundLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),


        ])
    }
    
    
    @objc
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
}

extension MoviesVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = viewModel.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTVC") as! MovieTVC
        cell.configure(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.deviceHeight * 0.3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let choosenMovie = viewModel.movies[indexPath.row]
        let movieDetailVC = MovieDetailVC()
        movieDetailVC.movie = choosenMovie
        movieDetailVC.navigationController?.navigationItem.backButtonTitle = moviesSearchBar.text
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
}

extension MoviesVC : UISearchBarDelegate {
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        DispatchQueue.main.async {
            searchBar.placeholder = "Search movie"
        }
        if let searchedText = searchBar.text {
            viewModel.fetchMovies(searchedText: searchedText)
        }
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            searchBar.placeholder = searchBar.text
        }
    }
}

extension MoviesVC : MovieDelegate {
    func movieNotFound() {
        
        
        DispatchQueue.main.async { [weak self] in
            
            guard let self else { return }
            
            self.view.endEditing(true)
            self.moviesTableView.isHidden = true
            self.movieNotFoundLabel.isHidden = false
            
        }
    }
    
    func moviesFetched() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.moviesTableView.isHidden = false
            self.movieNotFoundLabel.isHidden = true
            self.moviesTableView.reloadData()
        }
    }
    
    func presentAlert(message: String) {
        let alert = UIAlertController(title: "HATA!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "TAMAM", style: .default))
        self.present(alert, animated: true)
    }
    
    
}
