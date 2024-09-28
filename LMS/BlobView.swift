//
//  BlobView.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI

struct BlobView: View {
    var body: some View {
        Circle()
            .fill(Color.accentColor.opacity(0.1))
            .frame(width: 200, height: 200)
            .blur(radius: 30)
            .offset(x: 100, y: 100)
    }
}
