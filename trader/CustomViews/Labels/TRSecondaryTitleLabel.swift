//
//  TRSecondaryTitleLabel.swift
//  trader
//
//  Created by Fatih Sağlam on 15.06.2022.
//

import UIKit

class TRSecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .light)
        configure()
    }
    
    private func configure() {
        textColor = .gray
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }

}
