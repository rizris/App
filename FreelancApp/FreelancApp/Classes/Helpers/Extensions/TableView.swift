//
//  TableView.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

extension UITableView {
    static func staticTable() -> UITableView {
        let tableView = UITableView()
        tableView.backgroundColor = Constant.Colors.clear
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        return tableView
    }
}
