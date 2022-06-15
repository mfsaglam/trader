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

    var stockList: [MypageDefault] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        getStocks()
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
    
    func getStocks() {
        NetworkManager.shared.getStockList() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let stocks):
                self.stockList.append(contentsOf: stocks.mypageDefaults)
                
                self.updateData()
                
            case .failure(let error):
                print(error.rawValue)            }
        }
    }
    
    func updateData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func configureTableView() {
        var safeArea: UILayoutGuide!
        safeArea = view.layoutMarginsGuide
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        tableView.rowHeight = 55
        tableView.register(StockCell.self, forCellReuseIdentifier: StockCell.reuseID)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

extension StockListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StockCell.reuseID) as! StockCell
        cell.isUserInteractionEnabled = false
        let stock = stockList[indexPath.row]
        cell.set(stock: stock)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TRHeaderView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}

