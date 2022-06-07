//
//  MainCollectionViewCell.swift
//  TapEmoji
//
//  Created by KODDER on 06.06.2022.
//

import UIKit

final class MainCollectionViewCell: UICollectionViewCell {
    
    let idMainCollectionViewCell = "idMainCollectionViewCell"
    
    let emojiLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cellFaceUp = false {
        didSet {
            if self.cellFaceUp {
                backgroundColor = .black
            } else {
                backgroundColor = .white
                emojiLabel.text = ""
            }
        }
    }
    
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
        
        addSubview(emojiLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            emojiLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            emojiLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
