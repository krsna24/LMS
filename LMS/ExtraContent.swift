////
////  ContentView.swift
////  LMS
////
////  Created by Krsna Sharma on 28/08/24.
////
//
//import SwiftUI
//
//struct LibrarianDashboardView: View {
//    @State private var selectedSection: LibrarianSection = .dashboard
//    
//    var body: some View {
//        NavigationView {
//            Sidebar(selectedSection: $selectedSection)
//            MainContentView(selectedSection: $selectedSection)
//                .background(Color(.systemBackground))
//                .cornerRadius(20)
//                .shadow(color: Color.black.opacity(0.2), radius: 15, x: 0, y: 10)
//                .padding()
//                .overlay(
//                    BlobView().offset(x: 150, y: -100).opacity(0.15)
//                )
//        }
//    }
//}
//
//struct Sidebar: View {
//    @Binding var selectedSection: LibrarianSection
//    
//    var body: some View {
//        List {
//            ForEach(LibrarianSection.allCases, id: \.self) { section in
//                Label(section.rawValue, systemImage: section.iconName)
//                    .onTapGesture {
//                        withAnimation {
//                            selectedSection = section
//                        }
//                    }
//                    .foregroundColor(selectedSection == section ? .blue : .primary)
//                    .padding(.vertical, 8)
//                    .background(selectedSection == section ? Color.blue.opacity(0.1) :  Color.clear)
//                    .cornerRadius(8)
//            }
//        }
//        .listStyle(InsetGroupedListStyle())
//        .navigationTitle("Library Manager")
//        .padding(.top, 20)
//    }
//}
//
//struct MainContentView: View {
//    @Binding var selectedSection: LibrarianSection
//    
//    var body: some View {
//        switch selectedSection {
//        case .dashboard:
//            DashboardView()
//        case .books:
//            BooksManagementView()
//        case .users:
//            UserManagementView()
//        case .analytics:
//            AnalyticsView()
//        case .settings:
//            SettingsView()
//        }
//    }
//}
//
//enum LibrarianSection: String, CaseIterable {
//    case dashboard = "Dashboard"
//    case books = "Books"
//    case users = "Users"
//    case analytics = "Analytics"
//    case settings = "Settings"
//    
//    var iconName: String {
//        switch self {
//        case .dashboard: return "house.fill"
//        case .books: return "book.fill"
//        case .users: return "person.3.fill"
//        case .analytics: return "chart.bar.fill"
//        case .settings: return "gearshape.fill"
//        }
//    }
//}
//// MARK: - Dashboard View
//
//struct DashboardView: View {
//    @State private var overdueBooks = 2
//    @State private var pendingRegistrations = 3
//    @State private var newBooksToday = 5
//    @State private var borrowedBooks = 50
//    @State private var selectedDate = Date() // State variable to store the selected date
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            // Header with Dashboard title and DatePicker
//            HStack {
//                Text("Dashboard")
//                    .font(.largeTitle).bold()
//                    .foregroundColor(.primary)
//                
//                Spacer()
//                
//                // DatePicker for selecting date
//                DatePicker("", selection: $selectedDate, displayedComponents: .date)
//                    .labelsHidden() // Hide the label to display only the calendar icon
//                    .datePickerStyle(.automatic) // Makes the date picker compact and suitable for top-right corner
//                    .padding(.trailing)
//            }
//            .padding(.bottom)
//            
//            Text("Welcome back, user!")
//                .font(.title2)
//
//                .foregroundColor(.primary)
//
//            // Horizontal ScrollView for Event Images
//            Text("Live Events:")
//                .font(.headline)
//                .padding(.vertical)
//                .foregroundColor(.primary)
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 15) {
//                    ForEach(1..<7) { index in
//                        Image("event\(index)") // Replace with actual event images
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 250, height: 150)
//                            .cornerRadius(10)
//                            .shadow(radius: 5)
//                    }
//                }
//                .padding(.top, 30)
//                .padding(.leading,0)
//                .padding(.horizontal)
//            }
//            .frame(height: 120) // Set a fixed height for the scrollable image section
//            
//            Text("Today's Highlights:")
//                .font(.headline)
//                .padding(.top, 40)
//                .padding(.vertical)
//                .foregroundColor(.primary)
//            
//            // Existing GridView for Dashboard Cards
//            GridView(cards: [
//                DashboardCardView(title: "New Books", value: newBooksToday, subtitle: "Books added today", color: .blue),
//                DashboardCardView(title: "Overdue Books", value: overdueBooks, subtitle: "Books overdue", color: .red),
//                DashboardCardView(title: "Pending Registrations", value: pendingRegistrations, subtitle: "Pending user sign-ups", color: .orange),
//                DashboardCardView(title: "Borrowed Books", value: borrowedBooks, subtitle: "Books borrowed", color: .green)
//            ])
//            
//            Spacer()
//        }
//        .padding()
//        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
//        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
//        .overlay(BlobView().offset(x: -100, y: 200).opacity(0.1))
//    }
//}
//
//
//struct GridView<Content: View>: View {
//    var cards: [Content]
//    
//    var body: some View {
//        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
//            ForEach(0..<cards.count, id: \.self) { index in
//                cards[index]
//            }
//        }
//    }
//}
//
//// MARK: - Dashboard Card View
//
//struct DashboardCardView: View {
//    var title: String
//    var value: Int
//    var subtitle: String
//    var color: Color
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("\(value)")
//                .font(.largeTitle)
//                .bold()
//                .foregroundColor(color)
//            Text(title)
//                .font(.title2)
//                .foregroundColor(.primary)
//            Text(subtitle)
//                .font(.subheadline)
//                .foregroundColor(.secondary)
//        }
//        .padding()
//        .frame(width: 250, height: 150)
//        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
//        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
//    }
//}
//
//// MARK: - Books Management View
//
//struct BooksManagementView: View {
//    @State private var showingAddBookSheet = false
//    @State private var books = Book.sampleBooks
//
//    var body: some View {
//        VStack(spacing: 20) {
//            // Title Bar
//            HStack {
//                Text("Books Management")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding(.leading)
//                    .foregroundColor(.primary)
//                
//                Spacer()
//                
//                Button(action: {
//                    showingAddBookSheet.toggle()
//                }) {
//                    Label("Add Book", systemImage: "plus")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 15)
//                        .padding(.vertical, 10)
//                        .background(Color.accentColor)
//                        .cornerRadius(10)
//                }
//                .padding(.trailing)
//            }
//            .padding(.top, 20)
//
//            // Books List
//            ScrollView {
//                VStack(spacing: 15) {
//                    ForEach(books) { book in
//                        BookRow(book: book)
//                            .padding(.horizontal, 20)
//                    }
//                }
//                .padding(.top, 10)
//            }
//            
//            Spacer()
//        }
//        .sheet(isPresented: $showingAddBookSheet) {
//            AddBookView(books: $books)
//        }
//        .background(Color(.systemGroupedBackground).ignoresSafeArea())
//    }
//}
//
//// MARK: - Book Row
//
//struct BookRow: View {
//    var book: Book
//    
//    var body: some View {
//        HStack(spacing: 10) {
//            VStack(alignment: .leading, spacing: 4) {
//                Text(book.title)
//                    .font(.headline)
//                    .foregroundColor(.primary)
//                Text("Author: \(book.author)")
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//            }
//            
//            Spacer()
//            
//            Text(book.status)
//                .font(.caption)
//                .foregroundColor(book.status == "Available" ? .green : .red)
//                .padding(5)
//                .background(book.status == "Available" ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
//                .cornerRadius(5)
//        }
//        .padding(.vertical, 10)
//        .padding(.horizontal, 15)
//        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
//        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
//    }
//}
//
//// MARK: - Add Book View
//
//struct AddBookView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @Binding var books: [Book]
//    
//    @State private var title: String = ""
//    @State private var author: String = ""
//    @State private var genre: String = ""
//    @State private var isbn: String = ""
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("Book Information").foregroundColor(.primary)) {
//                    TextField("Title", text: $title)
//                    TextField("Author", text: $author)
//                    TextField("Genre", text: $genre)
//                    TextField("ISBN", text: $isbn)
//                }
//            }
//            .navigationTitle("Add New Book")
//            .navigationBarItems(leading: Button("Cancel") {
//                presentationMode.wrappedValue.dismiss()
//            }, trailing: Button("Save") {
//                let newBook = Book(title: title, author: author, status: "Available")
//                books.append(newBook)
//                presentationMode.wrappedValue.dismiss()
//            }
//            .disabled(title.isEmpty || author.isEmpty)) // Disable Save if fields are empty
//        }
//    }
//}
//
//// MARK: - Sample Data Models
//
//struct Book: Identifiable {
//    var id = UUID()
//    var title: String
//    var author: String
//    var status: String
//    
//    static let sampleBooks: [Book] = [
//        Book(title: "Swift Programming", author: "Apple Inc.", status: "Available"),
//        Book(title: "The SwiftUI Handbook", author: "Krishna Kumar", status: "Checked Out"),
//        Book(title: "iOS Development Essentials", author: "Neil Smyth", status: "Available"),
//        Book(title: "Design Patterns in Swift", author: "Chris Eidhof", status: "Checked Out")
//    ]
//}
//
//// MARK: - Placeholder Views
//
//struct BlobView: View {
//    var body: some View {
//        Circle()
//            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom))
//            .frame(width: 300, height: 300)
//            .blur(radius: 50)
//    }
//}
//
//struct LibrarianDashboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        LibrarianDashboardView()
//    }
//}
//
//struct AnalyticsView: View {
//    var body: some View {
//        VStack {
//            Text("Analytics")
//                .font(.largeTitle)
//                .padding(.bottom)
//                .foregroundColor(.primary)
//            
//            Text("Key Performance Indicators:")
//                .font(.headline)
//                .padding(.bottom)
//                .foregroundColor(.primary)
//            
//            VStack(alignment: .leading) {
//                Text("• Total Books: 1200")
//                Text("• Books Issued This Month: 250")
//                Text("• Active Users: 300")
//            }
//            .padding()
//            .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
//            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
//            
//            Spacer()
//        }
//        .padding()
//        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
//        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
//        .overlay(BlobView().offset(x: -120, y: 150).opacity(0.1))
//    }
//}
//
//struct SettingsView: View {
//    var body: some View {
//        VStack {
//            Text("Settings")
//                .font(.largeTitle)
//                .padding(.bottom)
//                .foregroundColor(.primary)
//            
//            Form {
//                Section(header: Text("Account Settings").foregroundColor(.primary)) {
//                    TextField("Username", text: .constant("Librarian"))
//                    SecureField("Password", text: .constant("password"))
//                }
//                
//                Section(header: Text("App Settings").foregroundColor(.primary)) {
//                    Toggle("Notifications", isOn: .constant(true))
//                    Toggle("Dark Mode", isOn: .constant(false))
//                }
//            }
//            
//            Spacer()
//        }
//        .padding()
//        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
//        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
//    }
//}

//// MARK: - User Data
//
//struct User: Identifiable {
//    var id = UUID()
//    var name: String
//    var status: String
//    
//    static let sampleUsers: [User] = [
//        User(name: "Ananya Singh", status: "Active"),
//        User(name: "Vivek Gupta", status: "Pending"),
//        User(name: "Madhav Tiwari", status: "Active"),
//        User(name: "Priya Nair", status: "Inactive")
//    ]
//}
//
//struct UserManagementView: View {
//    var body: some View {
//        VStack(spacing: 20) {
//            // Title Section
//            HStack {
//                Text("User Management")
//                    .font(.largeTitle)
//                    .bold()
//                    .foregroundColor(.primary)
//                    .padding(.leading)
//
//                Spacer()
//            }
//            .padding(.top, 20)
//            
//            // Subheadline
//            HStack {
//                Text("Manage library users:")
//                    .font(.headline)
//                    .foregroundColor(.secondary)
//                    .padding(.leading)
//                
//                Spacer()
//            }
//
//            // User List Section
//            ScrollView {
//                VStack(spacing: 15) {
//                    ForEach(User.sampleUsers) { user in
//                        UserRow(user: user)
//                            .padding(.horizontal, 20)
//                    }
//                }
//                .padding(.top, 10)
//            }
//
//            Spacer()
//        }
//        .background(Color(.systemGroupedBackground).ignoresSafeArea())
//    }
//}
//
//// MARK: - User Row
//
//struct UserRow: View {
//    var user: User
//    
//    var body: some View {
//        HStack(spacing: 10) {
//            VStack(alignment: .leading, spacing: 4) {
//                Text(user.name)
//                    .font(.headline)
//                    .foregroundColor(.primary)
//                Text("ID: \(user.id)")
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//            }
//            
//            Spacer()
//            
//            Text(user.status)
//                .font(.caption)
//                .foregroundColor(user.status == "Active" ? .green : .gray)
//                .padding(6)
//                .background(user.status == "Active" ? Color.green.opacity(0.2) : Color.gray.opacity(0.2))
//                .cornerRadius(5)
//        }
//        .padding(.vertical, 10)
//        .padding(.horizontal, 15)
//        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
//        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
//    }
//}


//
//import SwiftUI
//import Charts
//
//struct CombinedView: View {
//    @State private var overdueBooks = 2
//    @State private var pendingRegistrations = 3
//    @State private var newBooksToday = 5
//    @State private var borrowedBooks = 50
//    @State private var selectedDate = Date() // State variable to store the selected date
//
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 20) {
//                // Dashboard Section
//                VStack(alignment: .leading) {
//                    HStack {
//                        Text("Dashboard")
//                            .font(.largeTitle).bold()
//                            .foregroundColor(.primary)
//                        
//                        Spacer()
//                        
//                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
//                            .labelsHidden() // Hide the label to display only the calendar icon
//                            .datePickerStyle(.automatic) // Makes the date picker compact and suitable for top-right corner
//                            .padding(.trailing)
//                    }
//                    .padding(.bottom)
//                    
//                    Text("Welcome back, user!")
//                        .font(.title2)
//                        .foregroundColor(.primary)
//
//                    Text("Live Events:")
//                        .font(.headline)
//                        .padding(.vertical)
//                        .foregroundColor(.primary)
//                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 15) {
//                            ForEach(1..<7) { index in
//                                Image("event\(index)") // Replace with actual event images
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 250, height: 150)
//                                    .cornerRadius(10)
//                                    .shadow(radius: 5)
//                            }
//                        }
//                        .padding(.top, 30)
//                        .padding(.leading,0)
//                        .padding(.horizontal)
//                    }
//                    .frame(height: 120) // Set a fixed height for the scrollable image section
//                    
//                    Text("Today's Highlights:")
//                        .font(.headline)
//                        .padding(.top, 40)
//                        .padding(.vertical)
//                        .foregroundColor(.primary)
//                    
//                    GridView(cards: [
//                        DashboardCardView(title: "New Books", value: newBooksToday, subtitle: "Books added today", color: .blue),
//                        DashboardCardView(title: "Overdue Books", value: overdueBooks, subtitle: "Books overdue", color: .red),
//                        DashboardCardView(title: "Pending Registrations", value: pendingRegistrations, subtitle: "Pending user sign-ups", color: .orange),
//                        DashboardCardView(title: "Borrowed Books", value: borrowedBooks, subtitle: "Books borrowed", color: .green)
//                    ])
//                }
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
//                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
//                .overlay(BlobView().offset(x: -100, y: 200).opacity(0.1))
//
//                // Analytics Section
//                VStack(spacing: 20) {
//                    // Title
//                    HStack {
//                        Text("Analytics")
//                            .font(.largeTitle)
//                            .bold()
//                            .foregroundColor(.primary)
//                            .padding(.leading)
//                        
//                        Spacer()
//                    }
//                    .padding(.top, 20)
//
//                    // Subtitle
//                    HStack {
//                        Text("Key Performance Indicators")
//                            .font(.headline)
//                            .foregroundColor(.secondary)
//                            .padding(.leading)
//                        
//                        Spacer()
//                    }
//
//                    // KPI Grid
//                    GridView1(columns: 2, spacing: 15) {
//                        ForEach(kpiData) { kpi in
//                            AnalyticsCardView(
//                                title: kpi.title,
//                                value: kpi.value,
//                                icon: kpi.icon,
//                                color: kpi.color
//                            )
//                        }
//                    }
//                    .padding(.horizontal, 15)
//
//                    // Graphs Section
//                    VStack(alignment: .leading, spacing: 20) {
//                        Text("Analytics Overview")
//                            .font(.headline)
//                            .foregroundColor(.primary)
//                            .padding(.leading)
//                        
//                        // Books Issued Over Time (Bar Chart)
//                        Text("Books Issued Over the Last Week")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                            .padding(.leading)
//                        
//                        BooksIssuedChartView()
//
//                        // Active Users Growth (Line Chart)
//                        Text("Active Users Growth")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                            .padding(.leading)
//                        
//                        ActiveUsersChartView()
//                    }
//                    .padding(.horizontal, 15)
//                }
//                .background(Color(.systemGroupedBackground).ignoresSafeArea())
//            }
//            .padding(.bottom)
//        }
//    }
//}
//
//// Define GridView1 here or import it if defined elsewhere
