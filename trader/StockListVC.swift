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
    var stockData: [L?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        getStocks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
                self.updateViewOnMainThread()
                self.startUpdatingStocks()
                
            case .failure(let error):
                print(error.rawValue)            }
        }
    }
    
    func startUpdatingStocks() {
        var tkeList: [String] = []
        for stock in stockList { tkeList.append(stock.tke) }
        NetworkManager.shared.updateStockData(tkeList: tkeList) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.stockData.append(contentsOf: data.l)
                self.updateViewOnMainThread()
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    func updateViewOnMainThread() {
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
        let stock = stockList[indexPath.row]
        cell.set(stock: stock)
        if stockData.count != 0 {
            cell.updateStockData(with: stockData[indexPath.row])
        } else {
            cell.updateStockData(with: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TRHeaderView()
        headerView.delegate = self
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension StockListVC: TRHeaderViewDelegate {
    func didTapFilterButtonOne() {
        let actionSheet = UIAlertController(title: "Test", message: "Test", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Test", style: .cancel, handler: { action in
            print("test")
        }))
        present(actionSheet, animated: true)
    }
    
    func didTapFilterButtonTwo() {
        let actionSheet = UIAlertController(title: "Test", message: "Test", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Test", style: .cancel, handler: { action in
            print("test")
        }))
        present(actionSheet, animated: true)
    }
}

