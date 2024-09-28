//
//  LibrarianDashboardView.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI

struct LibrarianDashboardView: View {
    @State private var selectedSection: LibrarianSection = .dashboard
    
    var body: some View {
        NavigationView {
            Sidebar(selectedSection: $selectedSection)
            MainContentView(selectedSection: $selectedSection)
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 15, x: 0, y: 10)
                .padding()
                .overlay(
                    BlobView().offset(x: 150, y: -100).opacity(0.15)
                )
        }
    }
}

struct LibrarianDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        LibrarianDashboardView()
    }
}
