//
//  Constants.swift
//  14(Cell)
//
//  Created by Mark Goncharov on 16.01.2022.
//

import UIKit

enum Constants {
    enum Colors {
        static var blackIos: UIColor? {
            UIColor(named: "blackIos")
        }
    }
    
    enum Fonts {
        static var systemHeading: UIFont {
            UIFont.systemFont(ofSize: 30, weight: .semibold)
        }
        static var systemText: UIFont {
            UIFont.systemFont(ofSize: 20)
    }
}
    enum Image {
        static let austria = UIImage(named: "Austria")
        static let belgium = UIImage(named: "Belgium")
        static let france = UIImage(named: "France")
        static let germany = UIImage(named: "Germany")
        static let greece = UIImage(named: "Greece")
    }
}
