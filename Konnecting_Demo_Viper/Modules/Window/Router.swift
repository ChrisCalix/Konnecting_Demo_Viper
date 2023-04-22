//
//  Router.swift
//  Window
//
//  Created by Christian Calixto on 20/4/23.
//

import UIKit

class Router {

    typealias SubModules = (
        landingModule: (_ onStart: @escaping () -> Void) -> UIViewController,
        loginModule: () -> UIViewController
    )

    private unowned let window: UIWindow
    private let subModules: SubModules

    init(window: UIWindow, subModules: SubModules) {
        
        self.window = window
        self.subModules = subModules
    }
}

extension Router: Routing {

    func routeToLanding() {
        
        let landingView = subModules.landingModule { [weak self] in
            guard let self else { return }
            self.routeToLogin()
        }
        window.rootViewController = landingView
        self.window.makeKeyAndVisible()
    }

    func routeToLogin() {

        let loginView = subModules.loginModule()
        window.rootViewController = loginView
        self.window.makeKeyAndVisible()
    }
}
