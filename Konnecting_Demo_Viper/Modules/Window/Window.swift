//
//  Window.swift
//  Window
//
//  Created by Christian Calixto on 20/4/23.
//

import UIKit

protocol Presentation {

    
}

class Window: UIWindow {

    var presenter: Presentation?

    override init(windowScene: UIWindowScene) {
        super.init(windowScene: windowScene)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
