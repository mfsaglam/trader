//
//  ViewController.swift
//  trader
//
//  Created by Fatih Sağlam on 14.06.2022.
//

import UIKit

class StockListVC: UIViewController {
    
    var button = TRButton()
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    func configureUI() {
        view.addSubview(button)
        view.addSubview(tableView)
        button.set(title: "Son")
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 130),
            button.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        tableView.backgroundColor = .black
        tableView.rowHeight = 55
        tableView.register(StockCell.self, forCellReuseIdentifier: StockCell.reuseID)
    }
}

extension StockListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StockCell.reuseID) as! StockCell
        cell.isUserInteractionEnabled = false
        cell.set()
        return cell
    }
    
    
}

