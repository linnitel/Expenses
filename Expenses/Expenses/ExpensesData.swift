//
//  Struct.swift
//  Expenses
//
//  Created by Julia Martcenko on 03/02/2025.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
	var id = UUID()
	let name: String
	let type: String
	let amount: Double
	let currancy: String

	var color: Color {
		if amount < 10 {
			return .green
		} else if amount < 100 {
			return .yellow
		} else {
			return .red
		}
	}
}

@Observable
class Expenses {
	var items = [ExpenseItem]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(items) {
				UserDefaults.standard.set(encoded, forKey: "items")
			}
		}
	}

	init() {
		if let savedItems = UserDefaults.standard.data(forKey: "items") {
			if let decodeItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
				items = decodeItems
				return
			}
		}

		items = []
	}
}
