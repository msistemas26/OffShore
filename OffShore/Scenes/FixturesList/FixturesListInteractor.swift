//
//  FixturesListInteractor.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol FixturesListBusinessLogic
{
    func fetchFixtures(request: FixturesList.FetchFixtures.Request)
}

protocol FixturesListDataStore
{
    var fetchedFixtures: [Fixture] { get set }
    var selectedFixture: Fixture? { get set }
}

class FixturesListInteractor: FixturesListBusinessLogic, FixturesListDataStore
{
    var presenter: FixturesListPresentationLogic?
    var worker: FixturesListWorker?
    var fetchedFixtures: [Fixture] = []
    var selectedFixture: Fixture?
    
    // MARK: Methods
    
    func fetchFixtures(request: FixturesList.FetchFixtures.Request)
    {
         worker = FixturesListWorker()
         worker?.fetchFixtures{ (fetchedFixtures) in
            self.fetchedFixtures = fetchedFixtures
            let response = FixturesList.FetchFixtures.Response(fetchedFixtures: fetchedFixtures)
            self.presenter?.presentFixtures(response: response)
         }
    }
}
