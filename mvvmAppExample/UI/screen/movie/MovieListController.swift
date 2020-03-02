//
//  MovieListController.swift
//  mvvmAppExample
//
//  Created by Danijel Kunkic on 01/03/2020.
//  Copyright © 2020 Neli_IT. All rights reserved.
//

import UIKit

class MovieListController: UIViewController, ViewModelBased {
    
    typealias ViewModelType = MovieListViewModel
    
    /// UIViews and Components
    private var activityIndicator: UIActivityIndicatorView!
    private var movieTableViewComponent: MovieTableViewComponent!
    
    /// Properties
    var viewModel: ViewModelType!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupComponents()
        view.bringSubviewToFront(activityIndicator)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        activityIndicator.startAnimating()
        /// get movies from repo and observe
        viewModel.getMovies().observe = observeMovies
    }
}

// MARK: - Private instance methods
fileprivate extension MovieListController {
    
    /// Setup views
    func setupViews() {
        navigationItem.title = "Movies"
        
        activityIndicator = UIActivityIndicatorView(style: .gray)
            .styleParentView(view)
            .styleMakeConstraints {
                $0.height.width.equalTo(100)
                $0.center.equalToSuperview()
        }
        
    }
    
    /// Setup components
    func setupComponents() {
        movieTableViewComponent = MovieTableViewComponent(self)
            .styleParentView(self.view)
            .styleMakeConstraints {
                $0.bottom.trailing.leading.equalToSuperview()
                $0.top.equalToSuperview().offset(15)
        }
    }
    
    /// Observers
    func observeMovies(result: Result<[Movie], NSError>?) {
        switch result {
        case .success(let movies):
            /// Add movies to movie tableview component
            activityIndicator.stopAnimating()
            movieTableViewComponent.movies = movies
        case .failure:
            /// show error
            break
        case .none:
            break
        }
    }
}

// MARK: - MovieTableViewComponentDelegate
extension MovieListController: MovieTableViewComponentDelegate {
 
    func didTapOnMovie(_ movie: Movie) {
        // did select movie
    }
    
}
