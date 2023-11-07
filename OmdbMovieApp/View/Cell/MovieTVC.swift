//
//  MovieCell.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 5.11.2023.
//

import UIKit
import Kingfisher

class MovieTVC : UITableViewCell {
    
    private var movieImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    

    private var movieName : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textColor = .white
        return label
    }()
    
    private var movieYear : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews([movieImage,movieName,movieYear])
        setLayouts()
    }
    
    
    
    
    private func setLayouts(){
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            movieImage.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 20),
            movieImage.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.45),
            movieImage.heightAnchor.constraint(equalToConstant: contentView.frame.height * 5),
            
            movieName.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 25),
            movieName.leftAnchor.constraint(equalTo: movieImage.rightAnchor,constant: 10),
            movieName.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.5),
            movieName.heightAnchor.constraint(equalToConstant: 70),
            
            movieYear.topAnchor.constraint(equalTo: movieName.bottomAnchor,constant: 10),
            movieYear.leftAnchor.constraint(equalTo: movieName.leftAnchor)
        ])
    }
    
    func configure(with movie: Movie) {
        movieImage.kf.setImage(with: URL(string: movie.poster))
        movieYear.text = movie.year
        movieName.text = movie.title
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
