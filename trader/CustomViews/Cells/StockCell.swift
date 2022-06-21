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
    var firstLabel = TRTitleLabel(alignment: .right, fontSize: 20, color: .white)
    var secondLabel = TRTitleLabel(alignment: .right, fontSize: 20, color: .white)
    var lastUpdatedLabel = TRSecondaryTitleLabel(fontSize: 15)
    
    private var clo: String? {
        didSet {
            if oldValue != clo {
                lastUpdatedLabel.highlight()
            }
        }
    }
    
    private var indicatorEstimation: String? {
        didSet {
            indicatorView.changeIndicator(oldValue: oldValue, newValue: indicatorEstimation)
        }
    }

    
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
            lastUpdatedLabel.text = Messages.emptyValue
            indicatorEstimation = nil
            firstLabel.text = Messages.emptyValue
            firstLabel.updateColor(with: nil)
            secondLabel.text = "%\(Messages.emptyValue)"
            secondLabel.updateColor(with: nil)
            return
        }
        clo = value.clo
        lastUpdatedLabel.text = clo ?? Messages.emptyValue
        indicatorEstimation = value.las
        updateFirstColumn(with: value, for: callPair)
        updateSecondColumn(with: value, for: callPair)
    }
    
    
    private func updateFirstColumn(with value: L, for callPair: CallPair) {
        firstLabel.updateColor(with: .white)
        switch callPair.first {
        case .son:
            firstLabel.text = value.las ?? Messages.emptyValue
        case .percentageFark:
            firstLabel.text = "%\(value.pdd ?? Messages.emptyValue)"
            firstLabel.updateColor(with: value.pdd)
        case .fark:
            firstLabel.text = value.ddi ?? Messages.emptyValue
            firstLabel.updateColor(with: value.ddi)
        case .dusuk:
            firstLabel.text = value.low ?? Messages.emptyValue
        case .yuksek:
            firstLabel.text = value.hig ?? Messages.emptyValue
        case .alis:
            firstLabel.text = value.buy ?? Messages.emptyValue
        case .satis:
            firstLabel.text = value.sel ?? Messages.emptyValue
        case .ogKap:
            firstLabel.text = value.pdc ?? Messages.emptyValue
        case .tavan:
            firstLabel.text = value.cei ?? Messages.emptyValue
        case .taban:
            firstLabel.text = value.flo ?? Messages.emptyValue
        case .grupKodu:
            firstLabel.text = value.gco ?? Messages.emptyValue
        }
    }
    
    
    private func updateSecondColumn(with value: L, for callPair: CallPair) {
        secondLabel.updateColor(with: .white)
        switch callPair.second {
        case .son:
            secondLabel.text = value.las ?? Messages.emptyValue
        case .percentageFark:
            secondLabel.text = "%\(value.pdd ?? Messages.emptyValue)"
            secondLabel.updateColor(with: value.pdd)
        case .fark:
            secondLabel.text = "\(value.ddi ?? Messages.emptyValue)"
            secondLabel.updateColor(with: value.ddi)
        case .dusuk:
            secondLabel.text = value.low ?? Messages.emptyValue
        case .yuksek:
            secondLabel.text = value.hig ?? Messages.emptyValue
        case .alis:
            secondLabel.text = value.buy ?? Messages.emptyValue
        case .satis:
            secondLabel.text = value.sel ?? Messages.emptyValue
        case .ogKap:
            secondLabel.text = value.pdc ?? Messages.emptyValue
        case .tavan:
            secondLabel.text = value.cei ?? Messages.emptyValue
        case .taban:
            secondLabel.text = value.flo ?? Messages.emptyValue
        case .grupKodu:
            secondLabel.text = value.gco ?? Messages.emptyValue
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
            lastUpdatedLabel.leadingAnchor.constraint(equalTo: indicatorView.trailingAnchor, constant: padding - 4),
            lastUpdatedLabel.heightAnchor.constraint(equalToConstant: 21),
            
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
