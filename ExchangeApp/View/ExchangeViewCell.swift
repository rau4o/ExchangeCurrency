//
//  ExchangeViewCell.swift
//  ExchangeApp
//
//  Created by rau4o on 10/31/19.
//  Copyright © 2019 rau4o. All rights reserved.
//

import UIKit

class ExchangeViewCell: BaseCell {
    
    //MARK: - Properties
    var cardView = UIView()
    var currencyLabel = UILabel()
    
    override func setupView() {
        addSubviews()
        stylize()
        setConstraints()
    }
    
    //MARK: - Stylize Properties
    private func stylize() {
        cardView.backgroundColor = .black
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        
        currencyLabel.textAlignment = .center
        currencyLabel.backgroundColor = .lightGray
        currencyLabel.textColor = .white
    }
    
    //MARK: - add properties to view
    private func addSubviews() {
        addSubview(cardView)
        addSubview(currencyLabel)
    }
    
    //MARK: - SetConstraints
    private func setConstraints() {
        cardView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 0))
        
        currencyLabel.anchor(top: cardView.topAnchor, leading: cardView.leadingAnchor, bottom: cardView.bottomAnchor, trailing: cardView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: frame.width, height: frame.height))
    }
}
