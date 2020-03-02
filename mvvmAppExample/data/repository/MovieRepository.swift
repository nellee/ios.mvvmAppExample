//
//  MovieRepository.swift
//  mvvmAppExample
//
//  Created by Danijel Kunkic on 02/03/2020.
//  Copyright © 2020 Neli_IT. All rights reserved.
//

import Foundation

protocol MovieRepository {
    func fetchMovies() -> Observable<Result<[Movie], NSError>>
}

class MovieRepositoryImpl: MovieRepository {
    
    func fetchMovies() -> Observable<Result<[Movie], NSError>> {
        let observable = Observable<Result<[Movie], NSError>>()
        
        ///mock
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            observable.property = .success(self?.mockApiGetMovies() ?? [])
        }
        
        return observable
    }
    
    func mockApiGetMovies() -> [Movie] {
        return [
            Movie(title: "Parasite", description: "A poor family, the Kims, con their way into becoming the servants of a rich family, the Parks. But their easy life gets complicated when their deception is threatened with exposure."),
            Movie(title: "Joker", description: "In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker."),
            Movie(title: "The Invisible Man", description: "When Cecilia's abusive ex takes his own life and leaves her his fortune, she suspects his death was a hoax. As a series of coincidences turn lethal, Cecilia works to prove that she is being hunted by someone nobody can see.")
        ]
    }
    
}
