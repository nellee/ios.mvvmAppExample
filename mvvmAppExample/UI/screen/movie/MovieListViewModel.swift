//
//  MovieListViewModel.swift
//  mvvmAppExample
//
//  Created by Danijel Kunkic on 01/03/2020.
//  Copyright © 2020 Neli_IT. All rights reserved.
//

import Foundation

class MovieListViewModel: ViewModel {
    
    /// Properties
    var movieRepository: MovieRepository!
    
    /// Init
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

}

// MARK: - Public instance methods
extension MovieListViewModel {
    
    /// Fetch movies
    func getMovies() -> Observable<Result<[Movie], NSError>> { return movieRepository.fetchMovies() }
}
