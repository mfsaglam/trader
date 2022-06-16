//
//  TRSecondaryTitleLabel.swift
//  trader
//
//  Created by Fatih Sağlam on 15.06.2022.
//

import UIKit

class TRSecondaryTitleLabel: UILabel {
    
    var insets = UIEdgeInsets.zero

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
    
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
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
        padding(4, 4, 5, 5)
        layer.cornerRadius = 8
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }

}
