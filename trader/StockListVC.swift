//
//  ViewController.swift
//  trader
//
//  Created by Fatih Sağlam on 14.06.2022.
//

import UIKit

class StockListVC: UIViewController {
    
    var button = TRButton()
    var indicator = StockIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(button)
        view.addSubview(indicator)
        button.set(title: "Son")
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 130),
            button.heightAnchor.constraint(equalToConstant: 44),
            
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.topAnchor.constraint(equalTo: button.bottomAnchor),
            indicator.heightAnchor.constraint(equalToConstant: 45),
            indicator.widthAnchor.constraint(equalToConstant: 25)
        ])
    }


}

