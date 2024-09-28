//
//  Models.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import Foundation

// MARK: - Books Data

struct Book: Identifiable {
    var id: UUID
    var title: String
    var author: String
    
    static let sampleBooks = [
        Book(id: UUID(), title: "SwiftUI Essentials", author: "John Doe"),
        Book(id: UUID(), title: "Mastering iOS", author: "Jane Smith"),
        Book(id: UUID(), title: "Advanced Swift", author: "Emily Johnson")
    ]
}

// MARK: - User Data

struct User: Identifiable {
    var id = UUID()
    var name: String
    var status: String
    
    static let sampleUsers: [User] = [
        User(name: "Ananya Singh", status: "Active"),
        User(name: "Vivek Gupta", status: "Pending"),
        User(name: "Madhav Tiwari", status: "Active"),
        User(name: "Priya Nair", status: "Inactive")
    ]
}
