//
//  TopCollectionDataSource.swift
//  MVVM
//
//  Created by Nguyễn Đức Tân on 03/08/2023.
//

import UIKit

class TopCollectionDataSource : Observable<[PhotoViewEntity]>, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(PhotoCollectionViewCell.self, forIndexPath: indexPath) else {
            return UICollectionViewCell()
        }
        cell.imageView.setImage(withPath: value?[indexPath.row].url)
        return cell
    }
}
