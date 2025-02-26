//
//  ExpensesApp.swift
//  Expenses
//
//  Created by Julia Martcenko on 03/02/2025.
//

import SwiftUI
import SwiftData

@main
struct ExpensesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		.modelContainer(for: ExpenseItem.self)
    }
}
