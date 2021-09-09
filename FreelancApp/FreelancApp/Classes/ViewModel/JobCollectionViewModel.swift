//
//  JobCollectionViewModel.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import Foundation
import RxDataSources

struct JobCollectionViewModel {
    let date: String?
    var items: [JobViewModel]
    
    init(_ jobViewModel: [JobViewModel], _ date: String) {
        self.date = date
        self.items = jobViewModel
    }
}

extension JobCollectionViewModel: SectionModelType {
    init(original: JobCollectionViewModel, items: [JobViewModel]) {
        self = original
        self.items = items
    }
}
