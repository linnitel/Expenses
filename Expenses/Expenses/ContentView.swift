//
//  ContentView.swift
//  Expenses
//
//  Created by Julia Martcenko on 03/02/2025.
//

import SwiftUI


struct ContentView: View {
	@State private var expenses = Expenses()

	@State private var showAddExpenseView: Bool = false

    var body: some View {
		NavigationStack {
			List {
				ForEach(expenses.items) { item in
					HStack {
						VStack(alignment: .leading) {
							Text(item.name)
								.font(.headline)
							Text(item.type)
						}

						Spacer()
						Text(item.amount, format: .currency(code: "USD"))
					}
				}
				.onDelete(perform: removeItems)
			}
			.navigationTitle("iExpenses")
			.toolbar {
				Button("AddExpense", systemImage: "plus") {
					showAddExpenseView = true
				}
			}
			.sheet(isPresented: $showAddExpenseView) {
				AddView(expenses: expenses)
			}
		}
    }

	func removeItems(at offsets: IndexSet) {
		expenses.items.remove(atOffsets: offsets)
	}
}

#Preview {
    ContentView()
}
