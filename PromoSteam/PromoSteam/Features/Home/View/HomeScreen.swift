//
//  HomeScreen.swift
//  PromoSteam
//
//  Created by Anderson Moura on 11/01/24.
//

import UIKit

class HomeScreen: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .red
    }
}
