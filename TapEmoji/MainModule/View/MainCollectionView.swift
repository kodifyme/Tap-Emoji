//
//  MainCollectionView.swift
//  TapEmoji
//
//  Created by KODDER on 06.06.2022.
//

import UIKit

protocol SelectCollectionViewItemProtocol: AnyObject {
    func selectItem(indexPath: IndexPath)
}

final class MainCollectionView: UICollectionView {
    
    var count = 0
    
    weak var cellDelegate: SelectCollectionViewItemProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    convenience init(count: Int) {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.count = count
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        delegate = self
        dataSource = self
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        register(MainCollectionViewCell.self,
                 forCellWithReuseIdentifier: MainCollectionViewCell().idMainCollectionViewCell)
    }
}

//MARK: - UICollectionViewDataSource

extension MainCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell().idMainCollectionViewCell,
                                                            for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension MainCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellDelegate?.selectItem(indexPath: indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4.4,
               height: collectionView.frame.width / 4.4)
    }
}
