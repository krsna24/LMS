//
//  LMSApp.swift
//  LMS
//
//  Created by Krsna Sharma on 28/08/24.
//

import SwiftUI

@main
struct LMSApp: App {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LibrarianDashboardView().preferredColorScheme(isDarkMode ? .dark : .light)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
