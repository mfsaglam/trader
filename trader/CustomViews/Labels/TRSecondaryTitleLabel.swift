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
    
    func highlight() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.layer.backgroundColor = UIColor.darkGray.cgColor
            self?.layer.cornerRadius = 8
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.layer.backgroundColor = UIColor.clear.cgColor
            }
        }
    }
    
    private func configure() {
        textColor = .lightGray
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }

}
