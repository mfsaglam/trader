//
//  StockIndicatorView.swift
//  trader
//
//  Created by Fatih Sağlam on 14.06.2022.
//

import UIKit

enum IndicatorCase {
    case rising
    case declining
}

class StockIndicatorView: UIView {
    
    var indicatorImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        backgroundColor = .systemGreen
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(indicatorImage)
        indicatorImage.translatesAutoresizingMaskIntoConstraints = false
        indicatorImage.image = UIImage(systemName: "chevron.compact.up", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .black))
        indicatorImage.contentMode = .scaleAspectFill
        indicatorImage.tintColor = .white
        
        NSLayoutConstraint.activate([
            indicatorImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indicatorImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 4),
            indicatorImage.heightAnchor.constraint(equalToConstant: 20),
            indicatorImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
