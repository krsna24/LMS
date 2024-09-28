//
//  DashboardView.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI
import Charts

struct DashboardView: View {
    @State private var overdueBooks = 2
    @State private var pendingRegistrations = 3
    @State private var newBooksToday = 5
    @State private var borrowedBooks = 50
    @State private var selectedDate = Date() // State variable to store the selected date

    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                // Dashboard Section
                VStack(alignment: .leading) {
                    HStack {
                        Text("Dashboard")
                            .font(.largeTitle).bold()
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        DatePicker("", selection: $selectedDate, displayedComponents: .date)
                            .labelsHidden() // Hide the label to display only the calendar icon
                            .datePickerStyle(.automatic) // Makes the date picker compact and suitable for top-right corner
                            .padding(.trailing)
                    }
                    .padding(.bottom)
                    
                    Text("Welcome back, user!")
                        .font(.title2)
                        .foregroundColor(.primary)

                    Text("Live Events:")
                        .font(.headline)
                        .padding(.vertical)
                        .foregroundColor(.primary)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(1..<7) { index in
                                Image("event\(index)") // Replace with actual event images
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 250, height: 150)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        }
                        .padding(.top, 30)
                        .padding(.leading,0)
                        .padding(.horizontal)
                    }
                    .frame(height: 120) // Set a fixed height for the scrollable image section
                    
                    Text("Today's Highlights:")
                        .font(.headline)
                        .padding(.top, 40)
                        .padding(.vertical)
                        .foregroundColor(.primary)
                    
                    GridView(cards: [
                        DashboardCardView(title: "New Books", value: newBooksToday, subtitle: "Books added today", color: .blue),
                        DashboardCardView(title: "Overdue Books", value: overdueBooks, subtitle: "Books overdue", color: .red),
                        DashboardCardView(title: "Pending Registrations", value: pendingRegistrations, subtitle: "Pending user sign-ups", color: .orange),
                        DashboardCardView(title: "Borrowed Books", value: borrowedBooks, subtitle: "Books borrowed", color: .green)
                    ])
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                .overlay(BlobView().offset(x: -100, y: 200).opacity(0.1))

                // Analytics Section
                VStack(spacing: 20) {
                    // Title
                    HStack {
                        Text("Analytics")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.primary)
                            .padding(.leading)
                        
                        Spacer()
                    }
                    .padding(.top, 20)

                    // Subtitle
                    HStack {
                        Text("Key Performance Indicators")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .padding(.leading)
                        
                        Spacer()
                    }

                    // KPI Grid
                    GridView1(columns: 2, spacing: 15) {
                        ForEach(kpiData) { kpi in
                            AnalyticsCardView(
                                title: kpi.title,
                                value: kpi.value,
                                icon: kpi.icon,
                                color: kpi.color
                            )
                        }
                    }
                    .padding(.horizontal, 15)

                    // Graphs Section
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Analytics Overview")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.leading)
                        
                        // Books Issued Over Time (Bar Chart)
                        Text("Books Issued Over the Last Week")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.leading)
                        
                        BooksIssuedChartView()

                        // Active Users Growth (Line Chart)
                        Text("Active Users Growth")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(.leading)
                        
                        ActiveUsersChartView()
                    }
                    .padding(.horizontal, 15)
                }
                .background(Color(.systemGroupedBackground).ignoresSafeArea())
            }
            .padding(.bottom)
        }
        
//        VStack(alignment: .leading) {
//            HStack {
//                Text("Dashboard")
//                    .font(.largeTitle).bold()
//                    .foregroundColor(.primary)
//                
//                Spacer()
//                
//                DatePicker("", selection: $selectedDate, displayedComponents: .date)
//                    .labelsHidden() // Hide the label to display only the calendar icon
//                    .datePickerStyle(.automatic) // Makes the date picker compact and suitable for top-right corner
//                    .padding(.trailing)
//            }
//            .padding(.bottom)
//            
//            Text("Welcome back, user!")
//                .font(.title2)
//                .foregroundColor(.primary)
//
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
//            GridView(cards: [
//                DashboardCardView(title: "New Books", value: newBooksToday, subtitle: "Books added today", color: .blue),
//                DashboardCardView(title: "Overdue Books", value: overdueBooks, subtitle: "Books overdue", color: .red),
//                DashboardCardView(title: "Pending Registrations", value: pendingRegistrations, subtitle: "Pending user sign-ups", color: .orange),
//                DashboardCardView(title: "Borrowed Books", value: borrowedBooks, subtitle: "Books borrowed", color: .green)
//            ])
//            
//            Spacer()
//        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        .overlay(BlobView().offset(x: -100, y: 200).opacity(0.1))
    }
}

struct DashboardCardView: View {
    var title: String
    var value: Int
    var subtitle: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(value)")
                .font(.largeTitle)
                .bold()
                .foregroundColor(color)
            Text(title)
                .font(.title2)
                .foregroundColor(.primary)
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(width: 250, height: 150)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}


