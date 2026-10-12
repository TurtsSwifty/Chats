//
//  Font.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 12/10/26.
//

import UIKit
import SwiftUI

extension Font {
    static func app(_ size: CGFloat, weight: UIFont.Weight = .regular) -> Font {
        Font(UIFont.systemFont(ofSize: size, weight: weight))
    }
}
