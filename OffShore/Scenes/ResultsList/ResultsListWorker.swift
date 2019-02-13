//
//  ResultsListWorker.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class ResultsListWorker
{
    let dataProviderApi = DataProviderApi()
    
    func fetchResults(completionHandler completion: @escaping ([Result]) -> Void)
    {
        dataProviderApi.fetchResults(){ (results) in
            completion(results)
        }
    }
}
