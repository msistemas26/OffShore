//
//  FixturesListWorker.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class FixturesListWorker
{
    let dataProviderApi = DataProviderApi()
    
    func fetchFixtures(completionHandler completion: @escaping ([Fixture]) -> Void)
    {
        dataProviderApi.fetchFixtures(){ (fixtures) in
                completion(fixtures)
        }
    }
}
