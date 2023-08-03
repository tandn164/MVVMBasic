//
//  TopViewModel.swift
//  MVVM
//
//  Created by Nguyễn Đức Tân on 03/08/2023.
//

import Foundation

class TopViewModel {
    var error: Observable<String>?
    var isLoading: Observable<Bool>?
    var dataSource = TopCollectionDataSource(value: [])
    
    init() {
        self.error = Observable<String>(value: nil)
        self.isLoading = Observable<Bool>(value: nil)
    }
    
    func getData(){
        self.isLoading?.value = true
        PhotoApi(.getListPhoto).send { [weak self] photos, error in
            self?.isLoading?.value = false
            self?.dataSource.value = photos
            if let error = error {
                self?.error?.value = error.localizedDescription
            }
        }
    }
}
