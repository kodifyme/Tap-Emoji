//
//  MainViewController.swift
//  TapEmoji
//
//  Created by KODDER on 06.06.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var collectionView = MainCollectionView(count: 20)
    private let emojiArray = ["💪", "🏆", "😎", "😈", "💥", "❤️", "💋", "🥰", "🥳", "🤩"]
    
    private lazy var gameModel = GameModel(numberPairsCards:
                                            collectionView.numberOfItems(inSection: 0) / 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        view.addSubview(collectionView)
        collectionView.cellDelegate = self
    }
}

//MARK: - SelectCollectionViewItemProtocol

extension MainViewController: SelectCollectionViewItemProtocol {
    
    func selectItem(indexPath: IndexPath) {
        
        gameModel.selectCard(index: indexPath.item)
        
        for (value, card) in gameModel.cards.enumerated() {
            let cell = collectionView.cellForItem(at: [0, value]) as? MainCollectionViewCell
            cell?.isHidden = card.isMatched
            cell?.cellFaceUp = card.isFaceUp
            cell?.emojiLabel.text = card.isFaceUp ? emojiArray[card.identifier] : ""
        }
    }
}

//MARK: - Set Constraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
}
