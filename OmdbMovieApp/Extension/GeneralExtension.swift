//
//  GeneralExtension.swift
//  OmdbMovieApp
//
//  Created by Macbook Air on 5.11.2023.
//

import UIKit


extension UIView {
    func addSubviews(_ views : [UIView]){
        views.forEach { view in
            addSubview(view)
        }
    }
}
