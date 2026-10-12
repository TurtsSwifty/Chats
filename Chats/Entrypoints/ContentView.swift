//
//  ContentView.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 11/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: TabbedViews = .dms
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(TabbedViews.allCases) { i in
                i.view
                    .tabItem {
                        Label(i.title, systemImage: i.icon)
                    }
                    .tag(i)
            }
        }
    }
}
