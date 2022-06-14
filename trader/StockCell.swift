//
//  StockCell.swift
//  trader
//
//  Created by Fatih Sağlam on 14.06.2022.
//

import UIKit

class StockCell: UITableViewCell {
    
    static let reuseID = "StockCell"
    
    var indicatorView = StockIndicatorView()
    var stockName = TRTitleLabel(alignment: .left, fontSize: 20, color: .white)
    var lastUpdatedLabel = TRSecondaryTitleLabel(fontSize: 15)
    var priceLabel = TRTitleLabel(alignment: .right, fontSize: 20, color: .white)
    var changeLabel = TRTitleLabel(alignment: .right, fontSize: 20, color: .systemGreen)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set() {
        indicatorView.changeIndicator(with: .rising)
        stockName.text = "USD/TRY"
        lastUpdatedLabel.text = "10:34:40"
        priceLabel.text = "100"
        changeLabel.text = "%0.1"
    }
    
    private func configure() {
        addSubview(indicatorView)
        addSubview(stockName)
        addSubview(lastUpdatedLabel)
        addSubview(priceLabel)
        addSubview(changeLabel)
        
        backgroundColor = .black
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            indicatorView.heightAnchor.constraint(equalToConstant: 45),
            indicatorView.widthAnchor.constraint(equalToConstant: 25),
            
            stockName.leadingAnchor.constraint(equalTo: indicatorView.trailingAnchor, constant: padding),
            stockName.topAnchor.constraint(equalTo: indicatorView.topAnchor),
            stockName.widthAnchor.constraint(equalToConstant: 200),
            stockName.heightAnchor.constraint(equalToConstant: 24),
            
            lastUpdatedLabel.bottomAnchor.constraint(equalTo: indicatorView.bottomAnchor),
            lastUpdatedLabel.leadingAnchor.constraint(equalTo: indicatorView.trailingAnchor, constant: padding),
            lastUpdatedLabel.widthAnchor.constraint(equalTo: stockName.widthAnchor),
            lastUpdatedLabel.heightAnchor.constraint(equalToConstant: 20),
            
            changeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: padding),
            changeLabel.topAnchor.constraint(equalTo: indicatorView.topAnchor),
            changeLabel.widthAnchor.constraint(equalToConstant: 100),
            changeLabel.heightAnchor.constraint(equalToConstant: 24),
            
            priceLabel.trailingAnchor.constraint(equalTo: changeLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: indicatorView.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: stockName.trailingAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
}
