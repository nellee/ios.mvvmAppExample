//
//  MovieCell.swift
//  mvvmAppExample
//
//  Created by Danijel Kunkic on 02/03/2020.
//  Copyright © 2020 Neli_IT. All rights reserved.
//

import UIKit

/// Private movie cell constants
private struct Constants {
    static let textStackViewSpacing: CGFloat = 5.0
    static let movieTitleFontSize: CGFloat = 18.0
    static let movieDescriptionFontSize: CGFloat = 14.0
}

class MovieCell: UITableViewCell {
    static let reuseIdentifier = "MovieCell"
    
    /// UIViews
    private var containerView: UIView!
    private var rootStackView: UIStackView!
    private var movieTitleLabel: UILabel!
    private var movieDescriptionTextView: UITextView!
    
    /// Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    /// Cofigure cell with movie
    func configure(movie: Movie) {
        movieTitleLabel.styleText(movie.title)
        movieDescriptionTextView.styleText(movie.description)
    }
    
}

// MARK: - Setup extension
fileprivate extension MovieCell {
    
    /// Common init
    func commonInit() {
        self.contentView.styleBackgroundColor(.clear)
        self.styleBackgroundColor(.clear)
        self.selectionStyle = .none
        
        setupContainerView()
        setupRootStackView()
        setupMovieTitleLabelAndDescriptionTextView()
        setupBottomSeparator()
    }
    
    /// Setup main container view
    func setupContainerView() {
        containerView = UIView()
            .styleBackgroundColor(.white)
            .styleParentView(contentView)
            .styleMakeConstraints {
                $0.bottom.trailing.leading.equalToSuperview()
                $0.top.equalToSuperview().offset(15)
        }
    }
    
    /// Setup vertical root UIStackView
    func setupRootStackView() {
        rootStackView = UIStackView()
            .styleParentView(containerView)
            .styleAxis(.horizontal)
            .styleDistribution(.fillProportionally)
            .styleMakeConstraints {
                $0.edges.equalToSuperview()
            }
    }
    
    /// Setup Movie title UILabel and description UITextView
    func setupMovieTitleLabelAndDescriptionTextView() {
        let stackView = UIStackView()
            .styleAxis(.vertical)
            .styleSpacing(Constants.textStackViewSpacing)
            .styleParentView(containerView)
            .styleMakeConstraints { $0.edges.equalToSuperview() }
        
        movieTitleLabel = UILabel()
            .styleFont(.systemFont(ofSize: Constants.movieTitleFontSize))
            .styleTextColor(.black)
            .styleNumberOfLines(0)
            .styleParentView(stackView)
        
        movieDescriptionTextView = UITextView()
            .styleIsScrollEnabled(false)
            .styleFont(.systemFont(ofSize: Constants.movieDescriptionFontSize))
            .styleTextColor(.lightGray)
            .styleUserInteractionEnabled(false)
            .styleParentView(stackView)
    }
    
    /// Setup horizontal bottom separator
    func setupBottomSeparator() {
        UIView()
            .styleParentView(containerView)
            .styleBackgroundColor(.lightGray)
            .styleMakeConstraints {
                $0.height.equalTo(1)
                $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}

