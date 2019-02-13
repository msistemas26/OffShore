//
//  ResultsListInteractor.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol ResultsListBusinessLogic
{
    func fetchResults(request: ResultsList.FetchResults.Request)
}

protocol ResultsListDataStore
{
    var fetchedResults: [Result] { get set }
    var selectedResult: Result? { get set }
}

class ResultsListInteractor: ResultsListBusinessLogic, ResultsListDataStore
{
    var presenter: ResultsListPresentationLogic?
    var worker: ResultsListWorker?
    var fetchedResults: [Result] = []
    var selectedResult: Result?
    
    // MARK: Methods
    
    func fetchResults(request: ResultsList.FetchResults.Request)
    {
         worker = ResultsListWorker()
         worker?.fetchResults{ (fetchedResults) in
            self.fetchedResults = fetchedResults
            let response = ResultsList.FetchResults.Response(fetchedResults: fetchedResults)
            self.presenter?.presentResults(response: response)
         }
    }
}
