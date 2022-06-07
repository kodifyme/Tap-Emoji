//
//  MainCollectionViewCell.swift
//  TapEmoji
//
//  Created by KODDER on 06.06.2022.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    let idMainCollectionViewCell = "idMainCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 10
        
    }
    
    private func setConstraints() {
        
    }
}
