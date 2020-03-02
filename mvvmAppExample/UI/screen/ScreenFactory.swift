//
//  ScreenFactory.swift
//  mvvmAppExample
//
//  Created by Danijel Kunkic on 01/03/2020.
//  Copyright © 2020 Neli_IT. All rights reserved.
//

import UIKit

class ScreenFactory {
    
    /// Movie list screen
    static func makeMovieListController() -> MovieListController {
        return MovieListController.instantiate(with: MovieListViewModel(movieRepository: AppModule.shared.movieRepository))
    }
    
}
