//
//  Builder.swift
//  Konnecting_Demo_Viper
//
//  Created by Christian Calixto on 21/4/23.
//

import UIKit
import UtilityShared
import UseCases

public final class Builder {

    public static func build() -> UIViewController {

        let stoyboard = UIStoryboard(name: "ChatroomLogin", bundle: Bundle(for: self))
        let view = ChatroomLoginViewConrtoller.instantiate(from: stoyboard)
        let accountInteractor = UseCasesFactory.accountInteractor
        let router = Router(viewController: view)
        view.presenterProducer = { input in
            Presenter(input: input,
                      router: router,
                      useCases: (
                        login: accountInteractor.login, ()
                      )
            )
        }
        
        return view
    }
}
