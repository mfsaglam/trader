//
//  StockIndicatorView.swift
//  trader
//
//  Created by Fatih Sağlam on 14.06.2022.
//

import UIKit

enum StockIndicatorCase {
    case rising
    case falling
    case natural
}

class StockIndicatorView: UIView {
    
    var indicatorImage = UIImageView()
    var situation: StockIndicatorCase?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(indicatorCase: StockIndicatorCase) {
        super.init(frame: .zero)
        configure(for: indicatorCase)
    }
    
    func changeIndicator(oldValue: String?, newValue: String?) {
        guard let oldValue = oldValue, let newValue = newValue else {
            configure(for: .natural)
            return
        }
        if newValue > oldValue {
            configure(for: .rising)
        } else {
            configure(for: .falling)
        }
    }
    
    private func configure(for indicatorCase: StockIndicatorCase = .natural) {
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(indicatorImage)
        indicatorImage.translatesAutoresizingMaskIntoConstraints = false
        indicatorImage.contentMode = .scaleAspectFill
        indicatorImage.tintColor = .white
        
        indicatorImage.removeAllConstraints()
        
        switch indicatorCase {
        case .rising:
            backgroundColor = .systemGreen
            indicatorImage.isHidden = false
            indicatorImage.image =
            UIImage(systemName: SFSymbols.up, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .black))
            
            NSLayoutConstraint.activate([
                indicatorImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 4)
            ])
        case .falling:
            backgroundColor = .systemRed
            indicatorImage.isHidden = false
            indicatorImage.image =
            UIImage(systemName: SFSymbols.down, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .black))
            
            NSLayoutConstraint.activate([
                indicatorImage.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -4)
            ])
        case .natural:
            backgroundColor = .systemGray
            indicatorImage.isHidden = true
        }
        
        NSLayoutConstraint.activate([
            indicatorImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicatorImage.heightAnchor.constraint(equalToConstant: 20),
            indicatorImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
}
