//
//  AnalyticsView.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI
import Charts

struct AnalyticsView: View {
    var body: some View {
        ScrollView {
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

                Spacer()
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
        }
    }
}

struct KPIData: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let icon: String
    let color: Color
}

let kpiData = [
    KPIData(title: "Total Books", value: "1,200", icon: "books.vertical", color: .blue),
    KPIData(title: "Books Issued This Month", value: "250", icon: "book", color: .green),
    KPIData(title: "Active Users", value: "300", icon: "person.3.fill", color: .orange),
    KPIData(title: "Late Returns", value: "20", icon: "clock.fill", color: .red)
]

// MARK: - Analytics Card View

struct AnalyticsCardView: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(color)
                
                Spacer()
            }
            
            Text(value)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.primary)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .padding(20)
        .frame(minWidth: 160, maxWidth: .infinity, minHeight: 120)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}

// MARK: - Books Issued Chart (Bar Chart)

struct BooksIssuedChartView: View {
    let data = [
        BookIssued(day: "Mon", count: 30),
        BookIssued(day: "Tue", count: 45),
        BookIssued(day: "Wed", count: 50),
        BookIssued(day: "Thu", count: 40),
        BookIssued(day: "Fri", count: 35),
        BookIssued(day: "Sat", count: 60),
        BookIssued(day: "Sun", count: 20)
    ]
    
    var body: some View {
        Chart {
            ForEach(data) { bookIssued in
                BarMark(
                    x: .value("Day", bookIssued.day),
                    y: .value("Books Issued", bookIssued.count)
                )
                .foregroundStyle(Color.blue)
            }
        }
        .frame(height: 200)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}

// MARK: - Active Users Growth (Line Chart)

struct ActiveUsersChartView: View {
    let data = [
        ActiveUserGrowth(month: "Jan", users: 200),
        ActiveUserGrowth(month: "Feb", users: 250),
        ActiveUserGrowth(month: "Mar", users: 275),
        ActiveUserGrowth(month: "Apr", users: 300),
        ActiveUserGrowth(month: "May", users: 320),
        ActiveUserGrowth(month: "Jun", users: 350)
    ]
    
    var body: some View {
        Chart {
            ForEach(data) { growth in
                LineMark(
                    x: .value("Month", growth.month),
                    y: .value("Active Users", growth.users)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(Color.green)
            }
        }
        .frame(height: 200)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}

// MARK: - Data Models for Charts

struct BookIssued: Identifiable {
    let id = UUID()
    let day: String
    let count: Int
}

struct ActiveUserGrowth: Identifiable {
    let id = UUID()
    let month: String
    let users: Int
}
