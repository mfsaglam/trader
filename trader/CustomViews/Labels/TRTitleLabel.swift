//
//  TRTitleLabel.swift
//  trader
//
//  Created by Fatih Sağlam on 15.06.2022.
//

import UIKit

class TRTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(alignment: NSTextAlignment, fontSize: CGFloat, color: UIColor) {
        self.init(frame: .zero)
        self.textAlignment = alignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        self.textColor = color
    }
    
    
    func updateColor(with value: String?) {
        guard let value = value else {
            textColor = .white
            return
        }
        if value.contains("-") {
            textColor = .systemRed
        } else {
            textColor = .systemGreen
        }
    }
    
    
    func updateColor(with color: UIColor) {
        textColor = color
    }
    
    
    private func configure() {
        textColor = .white
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        translatesAutoresizingMaskIntoConstraints = false
    }
}

