//
//  String+Extensions.swift
//  UtilityShared
//
//  Created by Christian Calixto on 22/4/23.
//

import Foundation

extension String {

    public func isEmail() -> Bool {
        
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pattern = NSPredicate(format: "SELF MATCHES %@", regex)
        return pattern.evaluate(with: self)
    }
}
