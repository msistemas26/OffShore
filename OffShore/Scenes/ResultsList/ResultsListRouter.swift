//
//  ResultsListRouter.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol ResultsListRoutingLogic
{
    func showSelectedResult(withResultIndex: Int)
}

protocol ResultsListDataPassing
{
    var dataStore: ResultsListDataStore? { get set }
}

class ResultsListRouter: NSObject, ResultsListRoutingLogic, ResultsListDataPassing
{
    weak var viewController: ResultsListViewController?
    var dataStore: ResultsListDataStore?
    
    // MARK: Routing
    
    func showSelectedResult(withResultIndex: Int)
    {
        /*
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        var destinationDS = destinationVC.router!.dataStore!
        passDataToConversation(source: dataStore!, destination: &destinationDS)
        navigateToConversation(source: viewController!, destination: destinationVC)
         */
    }
    
    /*
    // MARK: Navigation
    
    func navigateToConversation(source: ResultsListViewController, destination: ViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToConversation(source: ResultsListDataStore, destination: inout DataStore)
    {
        destination.value = ""
    }
    */
}
