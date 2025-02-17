//
//  AddView.swift
//  Expenses
//
//  Created by Julia Martcenko on 03/02/2025.
//

import SwiftUI

struct AddView: View {
	@Environment(\.dismiss) var dismiss

	@State private var name = "Name"
	@State private var type = "Personal"
	@State private var amount: Double = 0.0
	@State private var currancyCode = "USD"

	var expenses: Expenses

	let types = ["Business", "Personal"]
	let currancies = ["USD", "EUR", "RUB", "JPY"]

    var body: some View {
		NavigationStack {
			Form {
				Picker("Type", selection: $type) {
					ForEach(types, id: \.self) {
						Text($0)
					}
				}

				TextField("Amount", value: $amount, format: .currency(code: currancyCode))
					.keyboardType(.decimalPad)
				Picker("Currancy", selection: $currancyCode) {
					ForEach(currancies, id: \.self) {
						Text($0)
					}
				}
			}
			.navigationTitle($name)
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				Button("Save") {
					let item = ExpenseItem(name: name, type: type, amount: amount, currancy: currancyCode)
					expenses.items.append(item)
					dismiss()
				}
			}
		}
    }
}

#Preview {
	AddView(expenses: Expenses())
}
