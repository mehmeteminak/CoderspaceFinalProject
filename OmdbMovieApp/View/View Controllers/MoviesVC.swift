//
//  ViewController.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 5.11.2023.
//

import UIKit

class MoviesVC: UIViewController {

    var moviesTableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()
    
    lazy var moviesSearchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Batman"
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    var movieNotFoundLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.text = "Movie not found"
        label.isHidden = true
        label.layer.zPosition = 999
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    var viewModel = MoviesVM()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfig()
        viewModel.fetchMovies()
        
    }

    override func viewDidLayoutSubviews() {
        setLayouts()
    }

}

