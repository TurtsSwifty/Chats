//
//  ChatView.swift
//  Chats
//
//  Created by Flaky le Flaker (Mineturtlee) on 11/10/26.
//

import SwiftUI

struct DMChatView: View {
    @StateObject var motion = MotionDataProv.shared
    @AppStorage("bgParallax") private var parallax: Bool = true
    @Environment(\.colorScheme) private var colorScheme
    private var bg: Image {
        getBackground()
    }
    let channel: DMChannel
    let cache = Cache.shared
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4) {
                let sorted = channel.messages.sorted {
                    $0.sentDate < $1.sentDate
                }
                ForEach(sorted) { entry in
                    let mine = entry.isMine(user: cache.currentUser)
                    let green: Double = 72.0 / 255.0
                    let theirs = Color(red: 0.0, green: green, blue: 0.0)
                    let bubbleColor: Color = mine ? .white : theirs
                    
                    MaxWidthFraction(fraction: 0.8) {
                        VStack(alignment: .trailing, spacing: 2) {
                            Text(entry.content)
                                .foregroundStyle(mine ? Color.black : Color.white)
                                .multilineTextAlignment(.leading)
                            
                            Text(entry.sentDate.formatted(date: .omitted, time: .shortened))
                                .font(.app(10))
                                .foregroundStyle(Color.gray)
                        }
                        .padding(8)
                        .background(UnevenRoundedRectangle(topLeadingRadius: 17, bottomLeadingRadius: mine ? 17 : 7, bottomTrailingRadius: mine ? 7 : 17, topTrailingRadius: 17, style: .circular).fill(bubbleColor))
                        .offset(x: CGFloat(motion.x * 25 / 4), y: CGFloat(motion.y * 25 / 4))
                    }
                    .frame(maxWidth: .infinity, alignment: mine ? .trailing : .leading)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.all, 8)
            
            HStack(alignment: .bottom) {
                Menu("+") {
                    Menu {
                        Button {} label: {
                            Label("Camera", systemImage: "camera")
                        }
                        
                        Button {} label: {
                            Label("Choose media", systemImage: "photo")
                        }
                    } label: {
                        Label("Images", systemImage: "photo")
                    }
                }
                    .padding(.all, 2)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                    }
            }
            .padding(.all, 2)
        }
        .background {
            bg
                .scaledToFill()
                .scaleEffect(0.5, anchor: .center)
                .clipped()
                .offset(x: CGFloat(motion.x * 25), y: CGFloat(motion.y * 25))
                .ignoresSafeArea()
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            HStack {
                
            }
        }.onAppear {
            if self.parallax {
                motion.start()
            }
        }
        .onDisappear {
            motion.stop()
        }
        .multilineTextAlignment(.leading)
    }
    
    func getBackground() -> Image {
        switch colorScheme {
        case .dark: return Image(.chatsBGDark)
        case .light: return Image(.chatsBGLight)
        default: return Image(.chatsBGDark)
        }
    }
}

struct ChatView: View {
    @StateObject var motion = MotionDataProv.shared
    @AppStorage("bgParallax") private var parallax: Bool = true
    @Environment(\.colorScheme) private var colorScheme
    private var bg: Image {
        getBackground()
    }
    let channel: Channel
    
    var body: some View {
        VStack {
            
        }
        .background {
            bg
                .scaledToFill()
                .scaleEffect(0.5, anchor: .center)
                .clipped()
                .offset(x: CGFloat(motion.x * 25), y: CGFloat(motion.y * 25))
                .ignoresSafeArea()
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            HStack {
                
            }
        }.onAppear {
            if self.parallax {
                motion.start()
            }
        }
    }
    
    func getBackground() -> Image {
        switch colorScheme {
        case .dark: return Image(.chatsBGDark)
        case .light: return Image(.chatsBGLight)
        default: return Image(.chatsBGDark)
        }
    }
}
