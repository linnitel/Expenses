//
//  Struct.swift
//  Expenses
//
//  Created by Julia Martcenko on 03/02/2025.
//

import SwiftUI
import SwiftData

@Model
class ExpenseItem: Identifiable {
	var id = UUID()
	var name: String
	var type: String
	var amount: Double
	var currancy: String

	var color: Color {
		if amount < 10 {
			return .green
		} else if amount < 100 {
			return .yellow
		} else {
			return .red
		}
	}

	init(id: UUID = UUID(), name: String, type: String, amount: Double, currancy: String) {
		self.id = id
		self.name = name
		self.type = type
		self.amount = amount
		self.currancy = currancy
	}
}
