//
//  ViewController+Ext.swift
//  trader
//
//  Created by Fatih Sağlam on 17.06.2022.
//

import UIKit

extension UIViewController {
    
    func showAlertOnMainThread(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Something went wrong", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true)
        }
    }
}
