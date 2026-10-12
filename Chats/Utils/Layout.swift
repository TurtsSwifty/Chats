//
//  Layout.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 12/10/26.
//

import SwiftUI

struct MaxWidthFraction: Layout {
    var fraction: CGFloat = 0.8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard let sub = subviews.first else { return .zero }
        let maxW = proposal.width.map { $0 * fraction }
        return sub.sizeThatFits(ProposedViewSize(width: maxW, height: proposal.height))
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard let sub = subviews.first else { return }
        sub.place(at: bounds.origin, anchor: .topLeading,
                  proposal: ProposedViewSize(width: bounds.width, height: bounds.height))
    }
}
