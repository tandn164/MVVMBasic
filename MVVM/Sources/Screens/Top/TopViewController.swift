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
    }
}
