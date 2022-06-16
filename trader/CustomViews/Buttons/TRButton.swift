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
    
    func set(title: String) {
        self.titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        backgroundColor = .black
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureUI() {
        self.addSubview(buttonImageView)
        self.addSubview(titleLabel)
        
        buttonImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textAlignment = .right
        titleLabel.textColor = .systemGray
        
        buttonImageView.contentMode = .scaleAspectFill
        buttonImageView.image = UIImage(systemName: "chevron.compact.down")
        buttonImageView.tintColor = .systemGray
        
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
