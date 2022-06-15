//
//  TRHeaderView.swift
//  trader
//
//  Created by Fatih Sağlam on 15.06.2022.
//

import UIKit

class TRHeaderView: UIView {
    
    var symbolTitle = TRSecondaryTitleLabel(fontSize: 15)
    var filterButtonOne = TRButton()
    var filterButtonTwo = TRButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
