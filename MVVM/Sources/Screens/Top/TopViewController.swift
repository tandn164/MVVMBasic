//
//  TopViewController.swift
//  MVVM
//
//  Created by Nguyễn Đức Tân on 03/08/2023.
//

import UIKit

class TopViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textField: UITextField!
    
    private var viewModel = TopViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewType = .top
        setupCollectionView()
        initViewModel()
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = true
        
        collectionView.delegate = self
        collectionView.dataSource = self.viewModel.dataSource
        
        let layout = BouncyLayout()
        collectionView.collectionViewLayout = layout
        collectionView.registerCellByNib(PhotoCollectionViewCell.self)
    }
    
    func initViewModel(){
        viewModel.dataSource.addAndNotify(observer: self) { [weak self] _ in
            DispatchQueue.main.async { self?.collectionView.reloadData() }
        }
        
        viewModel.error?.addObserver(self) { [weak self] error in
            DispatchQueue.main.async { self?.showAlert(message: error ?? "") }
        }
        
        viewModel.isLoading?.addObserver(self) { _ in
        }
        
        viewModel.getData()
    }
}

extension TopViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 15)/2, height: 120)
    }
}
