//
//  TabbedViews.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 12/10/26.
//

import SwiftUI

enum TabbedViews: Int, CaseIterable, Identifiable {
    case dms, communities, me
    var id: Int { return rawValue }
    
    private var tuples: [(any View, String, String)] {
        [
            (DMsView(), "DMs", "message"),
            (CommunityView(), "Community", "house"),
            (MeView(), "me", "person")
        ]
    }
    
    var currentTuple: (any View, String, String) {
        switch self {
        case .dms: tuples.first { $0.0 is DMsView }!
        case .communities: tuples.first { $0.0 is CommunityView }!
        case .me: tuples.first { $0.0 is MeView }!
        }
    }
    
    var view: AnyView {
        AnyView(currentTuple.0)
    }
    
    var title: String {
        currentTuple.1
    }
    
    var icon: String {
        currentTuple.2
    }
}
