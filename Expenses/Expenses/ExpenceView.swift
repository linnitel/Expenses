//
//  ExpenceView.swift
//  Expenses
//
//  Created by Julia Martcenko on 26/02/2025.
//

import SwiftUI
import SwiftData

struct ExpenceView: View {
	@Query var expensesQuery: [ExpenseItem]

    var body: some View {
		List(expensesQuery) { expence in
			CellView(item: expence)
		}
    }

	init(expenceType: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
		if expenceType != "all" {
			_expensesQuery = Query(filter: #Predicate<ExpenseItem> { expense in
				expense.type == expenceType
			}, sort: sortOrder)
		} else {
			_expensesQuery = Query(sort: sortOrder)
		}

	}
}

#Preview {
	ExpenceView(expenceType: "Private", sortOrder: [SortDescriptor(\ExpenseItem.name)])
		.modelContainer(for: ExpenseItem.self)
}
