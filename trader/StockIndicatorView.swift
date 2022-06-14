//
//  StockIndicatorView.swift
//  trader
//
//  Created by Fatih Sağlam on 14.06.2022.
//

import UIKit

class StockIndicatorView: UIView {
    
    var indicatorImage = UIImageView()
    var isRising = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        backgroundColor = isRising ? .systemGreen : .systemRed
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(indicatorImage)
        indicatorImage.translatesAutoresizingMaskIntoConstraints = false
        indicatorImage.contentMode = .scaleAspectFill
        indicatorImage.tintColor = .white
        
        indicatorImage.image = isRising ?
        UIImage(systemName: "chevron.compact.up", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .black)) :
        UIImage(systemName: "chevron.compact.down", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .black))
        
        if isRising {
            NSLayoutConstraint.activate([
                indicatorImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                indicatorImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 4),
                indicatorImage.heightAnchor.constraint(equalToConstant: 20),
                indicatorImage.widthAnchor.constraint(equalToConstant: 20)
            ])
        } else {
            NSLayoutConstraint.activate([
                indicatorImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                indicatorImage.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -4),
                indicatorImage.heightAnchor.constraint(equalToConstant: 20),
                indicatorImage.widthAnchor.constraint(equalToConstant: 20)
            ])
        }
    }
}
