//
//  LMSApp.swift
//  LMS
//
//  Created by Krsna Sharma on 28/08/24.
//

import SwiftUI

@main
struct LMSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LibrarianDashboardView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
