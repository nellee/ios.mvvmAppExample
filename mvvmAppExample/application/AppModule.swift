//
//  AppModule.swift
//  mvvmAppExample
//
//  Created by Danijel Kunkic on 02/03/2020.
//  Copyright © 2020 Neli_IT. All rights reserved.
//

import Foundation

class AppModule {
    
    private static var privateShared: AppModule?
    
    class var shared: AppModule {
        if privateShared == nil {
            privateShared = AppModule()
        }
        return privateShared!
    }
    
    /// Repository
    lazy var movieRepository: MovieRepository = {
        return MovieRepositoryImpl()
    }()
    
    class func dispose() {
        privateShared = nil
    }
}
