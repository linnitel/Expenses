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
				Section("Personal") {
					ForEach(expenses.items) { item in
						if item.type == "Personal" {
							CellView(item: item)
						}
					}
					.onDelete(perform: removeItems)
				}
				Section("Business") {
					ForEach(expenses.items) { item in
						if item.type == "Business" {
							CellView(item: item)
						}
					}
					.onDelete(perform: removeItems)
				}
			}
			.navigationTitle("iExpenses")
			.toolbar {
				NavigationLink (destination: {
					AddView(expenses: expenses)
				}, label: {
					Image(systemName: "plus")
				})
			}
		}
	}

	func removeItems(at offsets: IndexSet) {
		expenses.items.remove(atOffsets: offsets)
	}
}

struct CellView: View {
	let item: ExpenseItem

	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(item.name)
					.font(.headline)
				Text(item.type)
			}

			Spacer()
			Text(item.amount, format: .currency(code: item.currancy))
				.foregroundStyle(item.color)
		}
	}
}

#Preview {
    ContentView()
}
