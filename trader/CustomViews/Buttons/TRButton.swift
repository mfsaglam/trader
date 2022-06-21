//
//  TRButton.swift
//  trader
//
//  Created by Fatih Sağlam on 14.06.2022.
//

import UIKit

class TRButton: UIControl {
    
    var titleLabel = TRSecondaryTitleLabel(fontSize: 14)
    var buttonImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(title: String) {
        self.titleLabel.text = title
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray.cgColor
        backgroundColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func configureUI() {
        self.addSubview(buttonImageView)
        self.addSubview(titleLabel)
  
        titleLabel.textAlignment = .right
        titleLabel.textColor = .systemGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        buttonImageView.contentMode = .scaleAspectFill
        buttonImageView.image = UIImage(systemName: SFSymbols.down)
        buttonImageView.tintColor = .systemGray
        buttonImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            buttonImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            buttonImageView.heightAnchor.constraint(equalToConstant: 15),
            buttonImageView.widthAnchor.constraint(equalToConstant: 15),
            
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: buttonImageView.leadingAnchor, constant: -padding),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
