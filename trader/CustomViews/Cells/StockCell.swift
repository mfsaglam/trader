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
    var firstLabel = TRTitleLabel(alignment: .right, fontSize: 20, color: .white)
    var secondLabel = TRTitleLabel(alignment: .right, fontSize: 20, color: .white)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStockNames(stock: MypageDefault) {
        stockName.text = stock.cod
    }
    
    func updateStockList(with value: L?, accordingTo callPair: CallPair?) {
        guard let value = value, let callPair = callPair else {
            indicatorView.changeIndicator(with: nil)
            lastUpdatedLabel.text = "---"
            firstLabel.text = "---"
            firstLabel.updateColor(with: nil)
            secondLabel.text = "%---"
            secondLabel.updateColor(with: nil)
            return
        }
        lastUpdatedLabel.text = value.clo ?? "---"
        indicatorView.changeIndicator(with: value.ddi)
        updateFirstColumn(with: value, for: callPair)
        updateSecondColumn(with: value, for: callPair)
    }
    
    private func updateFirstColumn(with value: L, for callPair: CallPair) {
        firstLabel.updateColor(with: .white)
        switch callPair.first {
        case .son:
            firstLabel.text = value.las ?? "---"
        case .percentageFark:
            firstLabel.text = "%\(value.pdd ?? "---")"
            firstLabel.updateColor(with: value.pdd)
        case .fark:
            firstLabel.text = value.ddi ?? "---"
            firstLabel.updateColor(with: value.pdd)
        case .dusuk:
            firstLabel.text = value.low ?? "---"
        case .yuksek:
            firstLabel.text = value.hig ?? "---"
        case .alis:
            firstLabel.text = value.buy ?? "---"
        case .satis:
            firstLabel.text = value.sel ?? "---"
        case .ogKap:
            firstLabel.text = value.pdc ?? "---"
        case .tavan:
            firstLabel.text = value.cei ?? "---"
        case .taban:
            firstLabel.text = value.flo ?? "---"
        case .grupKodu:
            firstLabel.text = value.gco ?? "---"
        }
    }
    
    private func updateSecondColumn(with value: L, for callPair: CallPair) {
        secondLabel.updateColor(with: .white)
        switch callPair.second {
        case .son:
            secondLabel.text = value.las ?? "---"
        case .percentageFark:
            secondLabel.text = "%\(value.pdd ?? "---")"
            secondLabel.updateColor(with: value.pdd)
        case .fark:
            secondLabel.text = "\(value.ddi ?? "---")"
            secondLabel.updateColor(with: value.pdd)
        case .dusuk:
            secondLabel.text = value.low ?? "---"
        case .yuksek:
            secondLabel.text = value.hig ?? "---"
        case .alis:
            secondLabel.text = value.buy ?? "---"
        case .satis:
            secondLabel.text = value.sel ?? "---"
        case .ogKap:
            secondLabel.text = value.pdc ?? "---"
        case .tavan:
            secondLabel.text = value.cei ?? "---"
        case .taban:
            secondLabel.text = value.flo ?? "---"
        case .grupKodu:
            secondLabel.text = value.gco ?? "---"
        }
    }
    
    private func configure() {
        addSubview(indicatorView)
        addSubview(stockName)
        addSubview(lastUpdatedLabel)
        addSubview(firstLabel)
        addSubview(secondLabel)
        
        isUserInteractionEnabled = false
        backgroundColor = .black
        
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate([
            indicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            indicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            indicatorView.heightAnchor.constraint(equalToConstant: 45),
            indicatorView.widthAnchor.constraint(equalToConstant: 25),
            
            stockName.leadingAnchor.constraint(equalTo: indicatorView.trailingAnchor, constant: padding),
            stockName.topAnchor.constraint(equalTo: indicatorView.topAnchor),
            stockName.widthAnchor.constraint(equalToConstant: 100),
            stockName.heightAnchor.constraint(equalToConstant: 24),
            
            lastUpdatedLabel.bottomAnchor.constraint(equalTo: indicatorView.bottomAnchor),
            lastUpdatedLabel.leadingAnchor.constraint(equalTo: indicatorView.trailingAnchor, constant: padding),
            lastUpdatedLabel.widthAnchor.constraint(equalTo: stockName.widthAnchor),
            lastUpdatedLabel.heightAnchor.constraint(equalToConstant: 20),
            
            secondLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding),
            secondLabel.topAnchor.constraint(equalTo: indicatorView.topAnchor),
            secondLabel.widthAnchor.constraint(equalToConstant: 100),
            secondLabel.heightAnchor.constraint(equalToConstant: 24),
            
            firstLabel.trailingAnchor.constraint(equalTo: secondLabel.leadingAnchor),
            firstLabel.topAnchor.constraint(equalTo: indicatorView.topAnchor),
            firstLabel.leadingAnchor.constraint(equalTo: stockName.trailingAnchor),
            firstLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
}
