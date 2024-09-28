//
//  LibrarianSection.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI

enum LibrarianSection: String, CaseIterable {
    case dashboard = "Dashboard"
    case books = "Books"
    case users = "Users"
//    case analytics = "Analytics"
    case settings = "Settings"
    
    var iconName: String {
        switch self {
        case .dashboard: return "house.fill"
        case .books: return "book.fill"
        case .users: return "person.3.fill"
//        case .analytics: return "chart.bar.fill"
        case .settings: return "gearshape.fill"
        }
    }
}
