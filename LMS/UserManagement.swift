//
//  UserManagement.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI

struct UserManagementView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Title Section
            HStack {
                Text("User Management")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.primary)
                    .padding(.leading)

                Spacer()
            }
            .padding(.top, 20)
            
            // Subheadline
            HStack {
                Text("Manage library users:")
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.leading)
                
                Spacer()
            }

            // User List Section
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(User.sampleUsers) { user in
                        UserRow(user: user)
                            .padding(.horizontal, 20)
                    }
                }
                .padding(.top, 10)
            }

            Spacer()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}

// MARK: - User Row


struct UserRow: View {
    var user: User
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 4) {
                Text(user.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("ID: \(user.id)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(user.status)
                .font(.caption)
                .foregroundColor(user.status == "Active" ? .green : .gray)
                .padding(6)
                .background(user.status == "Active" ? Color.green.opacity(0.2) : Color.gray.opacity(0.2))
                .cornerRadius(5)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .background(Color(.systemBackground).cornerRadius(10))
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
}
