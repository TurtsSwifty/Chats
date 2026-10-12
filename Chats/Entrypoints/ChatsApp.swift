//
//  ChatsApp.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 11/10/26.
//

import SwiftUI

@main
struct ChatsApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
        let backItem = UIBarButtonItemAppearance(style: .plain)
        backItem.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backItem.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
        
        let edge = UINavigationBarAppearance()
        edge.configureWithTransparentBackground()
        edge.backButtonAppearance = backItem
        
        let standard = UINavigationBarAppearance()
        standard.configureWithDefaultBackground()
        standard.backgroundColor = .clear
        standard.backButtonAppearance = backItem
        
        let bar = UINavigationBar.appearance()
        bar.standardAppearance = standard
        bar.compactAppearance = standard
        bar.scrollEdgeAppearance = edge
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .background: MotionDataProv.shared.stop()
            case .active: MotionDataProv.shared.start()
            case .inactive: MotionDataProv.shared.stop()
            @unknown default:
                MotionDataProv.shared.stop()
            }
        }
    }
}
