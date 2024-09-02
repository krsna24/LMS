//
//  AnalyticsView.swift
//  LMS
//
//  Created by Krsna Sharma on 02/09/24.
//

struct LibrarianAnalyticsView: View {
    @State private var selectedDate = Date()
    @State private var selectedIndex: Int? = nil
    @StateObject private var viewModel: AdminAnalyticsViewModel = AdminAnalyticsViewModel()
    @State private var showPopover = false
   // State variable to control sheet presentation

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    HStack {
                        
                        
                        
                        Text("Fable")
                            .font(.system(size: 50))
                            .foregroundColor(.themeOrange)
                            .fontWeight(.bold)
                            .padding(.leading, 10) // Adjust spacing as needed
                    }
                    .padding(.trailing, 30)
                    .padding(.top, 30)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                HStack(alignment: .center) {
                    Text("Monthly \nAnalytics")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    CustomDatePicker(date: $selectedDate)
                        .frame(width: 140, height: 40)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("ThemeOrange"), lineWidth: 1))
                        .frame(alignment: .center)
                    
                }
                .padding(.horizontal)
                .padding(.trailing)
                .padding(.leading, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(viewModel.analyticsData.indices, id: \.self) { index in
                            AnalyticsButton(
                                viewModel: viewModel,
                                data: viewModel.analyticsData[index],
                                isSelected: selectedIndex == index,
                                action: { selectedIndex = index }
                            )
                        }
                    }
                }
                .task {
                    await viewModel.updateUIwithChanges()
                }
                .padding(.top, 20)
                .padding(.leading, 50)
                
                // Add other views below the main content
                
                
                // Add more views as needed
            }
            .padding()
            .background(Color("BackgroundColor"))
            
        }
    }
}
