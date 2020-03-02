//
//  ScreenFactory.swift
//  
//
//  Created by Danijel Kunkic on 08/07/2019.
//  Copyright © 2019 Neli_IT. All rights reserved.
//

import UIKit

protocol ViewModel {
    
}

protocol ViewModelBased {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}

extension ViewModelBased where Self: UIViewController {
    
    static func instantiate(with viewModel: ViewModelType) -> Self {
        var viewController = Self.init()
        viewController.viewModel = viewModel
        return viewController
    }

}

protocol ViewModelBasedWithCallback {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
    
    var controllerCallback: (() -> Void)? { get set }
}

extension ViewModelBasedWithCallback where Self: UIViewController {

    static func instantiate(with viewModel: ViewModelType, controllerCallback: (() -> Void)?) -> Self {
        var viewController = Self.init()
        viewController.viewModel = viewModel
        viewController.controllerCallback = controllerCallback
        return viewController
    }
    
}
