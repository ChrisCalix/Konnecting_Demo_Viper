//
//  Builder.swift
//  Window
//
//  Created by Christian Calixto on 20/4/23.
//

import UIKit
import Landing
import ChatroomLogin

public final class Builder {

    public static func build(scene: UIWindowScene) -> UIWindow {

        let window = Window(windowScene: scene)
        let landingModule = Landing.Builder.build
        let loginModule = ChatroomLogin.Builder.build
        let router = Router(
            window: window,
            subModules: (
                landingModule: landingModule,
                loginModule: loginModule
            )
        )
        let presenter = Presenter(router: router)

        window.presenter = presenter

        return window
    }
}
