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
    var lastUpdatedLabel = TRSecondaryTitleLabel(fontSize: 10)
    var priceLabel = TRTitleLabel(alignment: .right, fontSize: 20, color: .white)
    var changeLabel = TRTitleLabel(alignment: .right, fontSize: 20, color: .systemGreen)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(indicatorView)
        addSubview(stockName)
        addSubview(lastUpdatedLabel)
        addSubview(priceLabel)
        addSubview(changeLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            indicatorView.heightAnchor.constraint(equalToConstant: 45),
            indicatorView.widthAnchor.constraint(equalToConstant: 25),
            
            stockName.leadingAnchor.constraint(equalTo: indicatorView.leadingAnchor, constant: padding),
            stockName.topAnchor.constraint(equalTo: indicatorView.topAnchor),
            stockName.widthAnchor.constraint(equalToConstant: 200),
            stockName.heightAnchor.constraint(equalToConstant: 24),
            
            lastUpdatedLabel.topAnchor.constraint(equalTo: stockName.bottomAnchor, constant: 4),
            lastUpdatedLabel.leadingAnchor.constraint(equalTo: stockName.leadingAnchor),
            lastUpdatedLabel.widthAnchor.constraint(equalTo: stockName.widthAnchor),
            lastUpdatedLabel.heightAnchor.constraint(equalToConstant: 14),
            
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
