//
//  Sidebar.swift
//  LMS
//
//  Created by Krsna Sharma on 08/09/24.
//

import SwiftUI

struct Sidebar: View {
    @Binding var selectedSection: LibrarianSection
    
    var body: some View {
        List {
            ForEach(LibrarianSection.allCases, id: \.self) { section in
                Label(section.rawValue, systemImage: section.iconName)
                    .onTapGesture {
                        withAnimation {
                            selectedSection = section
                        }
                    }
                    .foregroundColor(selectedSection == section ? .blue : .primary)
                    .padding(.vertical, 8)
                    .padding(.leading,10)
                    .background(selectedSection == section ? Color.blue.opacity(0.1) :  Color.clear)
                    .cornerRadius(8)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Library Manager")
        .padding(.top, 20)
    }
}
