//
//  TrailsTableViewWidget.swift
//  mvvmAppExample
//
//  Created by Danijel Kunkic on 01/03/2020.
//  Copyright © 2020 Neli_IT. All rights reserved.
//

import UIKit

protocol MovieTableViewComponentDelegate: class {
    func didTapOnMovie(_ movie: Movie)
}

class MovieTableViewComponent: UIView {
    
    /// UIViews
    private var tableView: UITableView!
    
    /// Properties
    private weak var delegate: MovieTableViewComponentDelegate?
    var movies: [Movie]? {
        didSet {
            tableView.reloadData()
        }
    }
    var isOpen: Bool = false
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    convenience init(_ delegate: MovieTableViewComponentDelegate) {
        defer {
            self.delegate = delegate
        }
        self.init(frame: .zero)
    }

}

// MARK: - Setup extension
fileprivate extension MovieTableViewComponent {
    
    func commonInit() {
        self.styleBackgroundColor(.white)
        setupTableView()
    }
    
    func setupTableView() {
        tableView = UITableView()
            .styleParentView(self)
            .styleMakeConstraints {
                $0.top.leading.equalToSuperview().offset(15)
                $0.trailing.bottom.equalToSuperview().inset(15)
        }
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reuseIdentifier)
    }
    
}

// MARK: - TableView UITableViewDelegate
extension MovieTableViewComponent: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            guard let safeMovies = movies else { return }
            
            delegate?.didTapOnMovie(safeMovies[indexPath.row])
        }
}

// MARK: - TableView UITableViewDataSource
extension MovieTableViewComponent: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier, for: indexPath) as! MovieCell
        
        guard let safeMovies = movies else { return cell }
        
        cell.configure(movie: safeMovies[indexPath.row])
        return cell
    }
}
