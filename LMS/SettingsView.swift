//
//  SettingsView.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State private var username: String = "Librarian"
    @State private var password: String = ""
    @State private var notificationsEnabled: Bool = true
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Account Settings")) {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }
                
                Section(header: Text("App Settings")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    Toggle("Dark Mode", isOn: $isDarkMode)
                        .onChange(of: isDarkMode) { newValue in
                            // Update dark mode setting
                            UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = newValue ? .dark : .light
                        }
                }
                
                Section(header: Text("About")) {
                    NavigationLink(destination: AboutView()) {
                        Text("About this App")
                    }
                }
                
                Section {
                    Button(action: {
                        // Handle logout action
                    }) {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct AboutView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("About this App")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Text("This app is designed to help librarians manage their library efficiently. Here you can adjust settings related to your account and app preferences.")
                .font(.body)
                .padding(.bottom, 20)
            
            Spacer()
        }
        .padding()
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}
