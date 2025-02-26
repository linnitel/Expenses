//
//  ContentView.swift
//  Expenses
//
//  Created by Julia Martcenko on 03/02/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	@Environment(\.modelContext) var modelContext
	@Query var expensesQuery: [ExpenseItem]

	@State private var showAddExpenseView: Bool = false
	@State private var selectedExpense: String = "all"
//	@State private var sortOrder: [SortDescriptor<ExpenseItem>] = [SortDescriptor(\ExpenseItem.name)]

	let types = ["all", "Personal", "Business"]
	@State private var sortOrder = [
		SortDescriptor(\ExpenseItem.name)
	]

    var body: some View {
		NavigationStack {
			ExpenceView(expenceType: selectedExpense, sortOrder: sortOrder)
//			List(expensesQuery) { expence in
//				CellView(item: expence)
//				Section("Personal") {
//					ForEach(expensesQuery) { item in
//						if item.type == "Personal" {
//							CellView(item: item)
//						}
//					}
//					.onDelete(perform: removeItems)
//				}
//				Section("Business") {
//					ForEach(expensesQuery) { item in
//						if item.type == "Business" {
//							CellView(item: item)
//						}
//					}
//					.onDelete(perform: removeItems)
//				}

//			}
				.navigationTitle("iExpenses")
				.toolbar {
					ToolbarItemGroup(placement: .topBarLeading) {
						Menu("Filter", systemImage: "camera.filters") {
							Picker("Type", selection: $selectedExpense) {
								ForEach(types, id: \.self) { type in
									Text(type)
								}
							}
						}
						Menu("Sort", systemImage: "arrow.up.arrow.down") {
							Picker("Sort", selection: $sortOrder) {
								Text("Sort by Name")
									.tag([
										SortDescriptor(\ExpenseItem.name)
									])
								
								Text("Sort by Join Date")
									.tag([
										SortDescriptor(\ExpenseItem.amount)
									])
							}
						}
					}
				ToolbarItem(placement: .topBarTrailing) {
					NavigationLink (destination: {
						AddView()
					}, label: {
						Image(systemName: "plus")
					})
				}
			}
		}
	}

	func removeItems(at offsets: IndexSet) {
		for offset in offsets {
			let item = expensesQuery[offset]
			modelContext.delete(item)
		}
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
