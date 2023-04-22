//
//  Builder.swift
//  Landing
//
//  Created by Christian Calixto on 21/4/23.
//

import UIKit
import UtilityShared

public final class Builder {

    public static func build(completion: @escaping () -> Void) -> UIViewController {

        let stoyboard = UIStoryboard(name: "Landing", bundle: Bundle(for: self))
        let view = LandingViewController.instantiate(from: stoyboard)
        view.onStart = completion
        return view
    }
}
