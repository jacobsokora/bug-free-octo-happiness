//
//  ViewController.swift
//  Expenses
//
//  Created by Jacob Sokora on 6/7/18.
//  Copyright © 2018 Jacob Sokora. All rights reserved.
//

import UIKit

class ExpensesViewController: UIViewController {

    @IBOutlet weak var expensesTableView: UITableView!
    let dateFormatter = DateFormatter()
    var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        expenses.append(Expense(title: "Dinner", amount: 32.5, date: Date(timeIntervalSince1970: TimeInterval(exactly: 1527877800)!)))
        expenses.append(Expense(title: "Office Supplies", amount: 59.35, date: Date(timeIntervalSince1970: TimeInterval(exactly: 1527682620)!)))
        expenses.append(Expense(title: "Uber", amount: 16.23, date: Date(timeIntervalSince1970: TimeInterval(exactly: 1527680580)!)))
        expenses.append(Expense(title: "Coffee", amount: 3.95, date: Date(timeIntervalSince1970: TimeInterval(exactly: 1527583500)!)))
        expensesTableView.dataSource = self
        expensesTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ExpensesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as! ExpenseTableViewCell
        let expense = expenses[indexPath.row]
        cell.titleLabel.text = expense.title
        cell.amountLabel.text = "$\(expense.amount)"
        cell.dateLabel.text = dateFormatter.string(from: expense.date)
        return cell
    }
}

extension ExpensesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
