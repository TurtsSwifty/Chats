//
//  BackButton.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 11/10/26.
//

#if os(tvOS)
import UIKit
import SwiftUI

struct BackButton: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> Controller {
        return Controller()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    final class Controller: UIViewController {
        override func willMove(toParent parent: UIViewController?) {
            super.willMove(toParent: parent)
            apply()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            apply()
        }
        
        private func apply() {
            var current: UIViewController? = self
            while let vc = current {
                if vc.parent is UINavigationController {
                    vc.navigationItem.backButtonDisplayMode = .minimal
                    return
                }
                current = vc.parent
            }
        }
    }
}

extension View {
    func smolBackButton() -> some View {
        background(BackButton())
    }
}
#endif
