//
//  TRHeaderView.swift
//  trader
//
//  Created by Fatih Sağlam on 15.06.2022.
//

import UIKit

protocol TRHeaderViewDelegate: AnyObject {
    func didTapFilterButtonOne()
    func didTapFilterButtonTwo()
}

class TRHeaderView: UIView {
    
    var symbolTitle = TRSecondaryTitleLabel(fontSize: 15)
    var filterButtonOne = TRButton()
    var filterButtonTwo = TRButton()
    
    weak var delegate: TRHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(buttonOne: String, buttonTwo: String) {
        filterButtonOne.set(title: buttonOne)
        filterButtonTwo.set(title: buttonTwo)
    }
    
    func configureButtons() {
        filterButtonOne.addTarget(self, action: #selector(filterButtonOneTapped), for: .touchUpInside)
        filterButtonTwo.addTarget(self, action: #selector(filterButtonTwoTapped), for: .touchUpInside)
    }
    
    @objc func filterButtonOneTapped() {
        delegate?.didTapFilterButtonOne()
    }
    
    @objc func filterButtonTwoTapped() {
        delegate?.didTapFilterButtonTwo()
    }
    
    func configure() {
        
        self.backgroundColor = .black
        addSubview(symbolTitle)
        addSubview(filterButtonOne)
        addSubview(filterButtonTwo)
        
        symbolTitle.text = "Sembol"
        filterButtonOne.set(title: "Son")
        filterButtonTwo.set(title: "%Fark")
        
        let leadingPadding: CGFloat = 55
        let trailingPadding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            symbolTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            symbolTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
            symbolTitle.widthAnchor.constraint(equalToConstant: 100),
            symbolTitle.heightAnchor.constraint(equalToConstant: 20),
            
            filterButtonTwo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            filterButtonTwo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -trailingPadding),
            filterButtonTwo.heightAnchor.constraint(equalToConstant: 40),
            filterButtonTwo.widthAnchor.constraint(equalToConstant: 90),
            
            filterButtonOne.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            filterButtonOne.trailingAnchor.constraint(equalTo: filterButtonTwo.leadingAnchor, constant: -trailingPadding),
            filterButtonOne.heightAnchor.constraint(equalToConstant: 40),
            filterButtonOne.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
}
