//
//  ViewController.swift
//  trader
//
//  Created by Fatih Sağlam on 14.06.2022.
//

import UIKit

class StockListVC: UIViewController {
    
    var tableView = UITableView()

    var stockList: [MypageDefault] = []
    var pageInfo: [Mypage] = []
    var stockData: [L?] = []
    
    var buttonOne = "Son"
    var buttonTwo = "%Fark"
    
    var callPair = CallPair(first: .son, second: .percentageFark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getStocksAndStartUpdating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func getStocksAndStartUpdating() {
        NetworkManager.shared.getStockList() { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let stocks):
                self.stockList.append(contentsOf: stocks.mypageDefaults)
                self.pageInfo.append(contentsOf: stocks.mypage)
                self.updateViewOnMainThread()
                self.startUpdatingStocks(pair: self.callPair)
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    func startUpdatingStocks(pair: CallPair) {
        var tkeList: [String] = []
        for stock in stockList { tkeList.append(stock.tke) }
        NetworkManager.shared.startUpdatingStockData(tkeList: tkeList, pair: pair) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.stockData.removeAll()
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
        view.addSubview(tableView)
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
        cell.setStockNames(stock: stock)
        if stockData.count != 0 {
            cell.updateStockList(with: stockData[indexPath.row], accordingTo: callPair)
        } else {
            cell.updateStockList(with: nil, accordingTo: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = TRHeaderView()
        headerView.delegate = self
        headerView.set(buttonOne: buttonOne, buttonTwo: buttonTwo)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension StockListVC: TRHeaderViewDelegate {
    func didTapFilterButtonOne() {
        let actionSheet = UIAlertController(title: "Kriter seçiniz", message: "", preferredStyle: .actionSheet)
        for info in pageInfo {
            actionSheet.addAction(UIAlertAction(title: info.name, style: .default, handler: { [weak self] action in
                guard let self = self else { return }
                self.buttonOne = action.title ?? ""
                let newPair = info.key.changeToPairByUpdatingFirst(second: self.callPair.second)!
                self.callPair = newPair
                self.startUpdatingStocks(pair: self.callPair)
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "İptal", style: .cancel, handler: { action in
        }))
        present(actionSheet, animated: true)
    }
    
    func didTapFilterButtonTwo() {
        let actionSheet = UIAlertController(title: "Kriter seçiniz", message: "", preferredStyle: .actionSheet)
        for info in pageInfo {
            actionSheet.addAction(UIAlertAction(title: info.name, style: .default, handler: { [weak self] action in
                guard let self = self else { return }
                self.buttonTwo = action.title ?? ""
                let newPair = info.key.changeToPairByUpdatingSecond(first: self.callPair.first)!
                self.callPair = newPair
                self.startUpdatingStocks(pair: self.callPair)
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "İptal", style: .cancel, handler: { action in
        }))
        present(actionSheet, animated: true)
    }
}

