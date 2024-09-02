//
//  ContentView.swift
//  LMS
//
//  Created by Krsna Sharma on 28/08/24.
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
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                .padding()
        }
    }
}

struct Sidebar: View {
    @Binding var selectedSection: LibrarianSection
    
    var body: some View {
        List {
            ForEach(LibrarianSection.allCases, id: \.self) { section in
                Label(section.rawValue, systemImage: section.iconName)
                    .onTapGesture {
                        selectedSection = section
                    }
                    .foregroundColor(.primary)
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Library Manager")
        
    }
}

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
        case .analytics:
            AnalyticsView()
        case .settings:
            SettingsView()
        }
    }
}

enum LibrarianSection: String, CaseIterable {
    case dashboard = "Dashboard"
    case books = "Books"
    case users = "Users"
    case analytics = "Analytics"
    case settings = "Settings"
    
    var iconName: String {
        switch self {
        case .dashboard: return "house.fill"
        case .books: return "book.fill"
        case .users: return "person.3.fill"
        case .analytics: return "chart.bar.fill"
        case .settings: return "gearshape.fill"
        }
    }
}

struct DashboardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Dashboard")
                .font(.largeTitle)
                .padding(.bottom)
                .foregroundColor(.primary)
            
            Text("Welcome back, user!")
                .font(.title2)
                .padding(.bottom)
                .foregroundColor(.primary)
            
            Text("Today's Highlights:")
                .font(.headline)
                .padding(.vertical)
                .foregroundColor(.primary)
            
            VStack(alignment: .leading) {
                Text("• 5 new books added today")
                Text("• 2 books are overdue")
                Text("• 3 user registrations pending")
            }.frame(width: 1000)
            .padding(.bottom)
            .foregroundColor(.primary)
            
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct BooksManagementView: View {
    @State private var showingAddBookSheet = false

    var body: some View {
        VStack {
            HStack {
                Text("Books Management")
                    .font(.largeTitle)
                    .padding(.bottom)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: {
                    showingAddBookSheet.toggle()
                }) {
                    Label("Add Book", systemImage: "plus")
                        .foregroundColor(.accentColor)
                }
                .padding(.trailing)
            }
            .padding()
            
            List {
                ForEach(Book.sampleBooks) { book in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text("Author: \(book.author)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text(book.status)
                            .font(.caption)
                            .padding(5)
                            .background(book.status == "Available" ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
                            .cornerRadius(5)
                    }
                    .padding(.vertical, 5)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .sheet(isPresented: $showingAddBookSheet) {
            AddBookView()
        }
    }
}

struct AddBookView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Book Information").foregroundColor(.primary)) {
                    TextField("Title", text: .constant(""))
                    TextField("Author", text: .constant(""))
                    TextField("Genre", text: .constant(""))
                    TextField("ISBN", text: .constant(""))
                }
            }
            .navigationTitle("Add New Book")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct UserManagementView: View {
    var body: some View {
        VStack {
            Text("User Management")
                .font(.largeTitle)
                .padding(.bottom)
                .foregroundColor(.primary)
            
            Text("Manage library users:")
                .font(.headline)
                .padding(.bottom)
                .foregroundColor(.primary)
            
            List {
                ForEach(User.sampleUsers) { user in
                    HStack {
                        VStack(alignment: .leading) {
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
                            .padding(5)
                            .background(user.status == "Active" ? Color.green.opacity(0.1) : Color.gray.opacity(0.1))
                            .cornerRadius(5)
                    }
                    .padding(.vertical, 5)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
                }
            }
            .listStyle(InsetGroupedListStyle())
            
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct AnalyticsView: View {
    var body: some View {
        VStack {
            Text("Analytics")
                .font(.largeTitle)
                .padding(.bottom)
                .foregroundColor(.primary)
            
            Text("Key Performance Indicators:")
                .font(.headline)
                .padding(.bottom)
                .foregroundColor(.primary)
            
            VStack(alignment: .leading) {
                Text("• Total Books: 1200")
                Text("• Books Issued This Month: 250")
                Text("• Active Users: 300")
            }
            .padding(.bottom)
            .foregroundColor(.primary)
            
            Spacer()
        }
        .padding().frame(width: 1000)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding(.bottom)
                .foregroundColor(.primary)
            
            Form {
                Section(header: Text("Account Settings").foregroundColor(.primary)) {
                    TextField("Username", text: .constant("Librarian"))
                    SecureField("Password", text: .constant("password"))
                }
                
                Section(header: Text("App Settings").foregroundColor(.primary)) {
                    Toggle("Notifications", isOn: .constant(true))
                    Toggle("Dark Mode", isOn: .constant(false))
                }
            }
            
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

// Sample data models for hard-coded content
struct Book: Identifiable {
    var id = UUID()
    var title: String
    var author: String
    var status: String
    
    static let sampleBooks: [Book] = [
        Book(title: "Swift Programming", author: "Apple Inc.", status: "Available"),
        Book(title: "The SwiftUI Handbook", author: "Krishna Kumar", status: "Checked Out"),
        Book(title: "iOS Development Essentials", author: "Neil Smyth", status: "Available"),
        Book(title: "Design Patterns in Swift", author: "Chris Eidhof", status: "Checked Out")
    ]
}

struct User: Identifiable {
    var id = UUID()
    var name: String
    var status: String
    
    static let sampleUsers: [User] = [
        User(name: "Ananya Kumar", status: "Active"),
        User(name: "Abhishek Jain", status: "Inactive"),
        User(name: "Nitin Kumar", status: "Active"),
        User(name: "Abhinav Choudhry", status: "Active")
    ]
}

struct LibrarianDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LibrarianDashboardView()
                .previewDevice("iPad Pro (12.9-inch)")
                .preferredColorScheme(.light)
            LibrarianDashboardView()
                .previewDevice("iPad Pro (12.9-inch)")
                .preferredColorScheme(.dark)
        }
    }
}
