//
//  GridView.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI

struct GridView<Content: View>: View {
    var cards: [Content]
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
            ForEach(0..<cards.count, id: \.self) { index in
                cards[index]
            }
        }
    }
}

struct GridView1<Content: View>: View {
    let columns: Int
    let spacing: CGFloat
    let content: () -> Content

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: spacing), count: columns), spacing: spacing) {
            content()
        }
    }
}
