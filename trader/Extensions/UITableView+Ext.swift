//
//  UITableView+Ext.swift
//  trader
//
//  Created by Fatih Sağlam on 20.06.2022.
//

import UIKit

extension UITableView {
    
    func removeExceedCells() {
        self.tableFooterView = UIView(frame: .zero)
    }
}
