//
//  Router.swift
//  ChatroomLogin
//
//  Created by Christian Calixto on 21/4/23.
//

import UIKit

class Router {

    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension Router: Routing {

}
