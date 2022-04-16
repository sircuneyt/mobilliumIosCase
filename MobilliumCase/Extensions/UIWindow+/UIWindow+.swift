//
//  UIWindow+.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 14.04.2022.
//

import Foundation
import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
