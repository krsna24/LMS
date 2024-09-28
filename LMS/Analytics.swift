//
//  Analytics.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

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
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
            
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)))
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        .overlay(BlobView().offset(x: -120, y: 150).opacity(0.1))
    }
}

