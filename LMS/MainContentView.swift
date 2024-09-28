//
//  MainContentView.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI

struct MainContentView: View {
    @Binding var selectedSection: LibrarianSection
    
    var body: some View {
        switch selectedSection {
        case .dashboard:
            DashboardView()
        case .books:
            BooksManagementView()
        case .users:
            UserManagementView()
//        case .analytics:
//            AnalyticsView()
        case .settings:
            SettingsView()
        }
    }
}
