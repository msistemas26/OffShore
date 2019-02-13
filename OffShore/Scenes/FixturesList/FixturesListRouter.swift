//
//  FixturesListRouter.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol FixturesListRoutingLogic
{
    func showSelectedFixture(withFixtureIndex: Int)
}

protocol FixturesListDataPassing
{
    var dataStore: FixturesListDataStore? { get set }
}

class FixturesListRouter: NSObject, FixturesListRoutingLogic, FixturesListDataPassing
{
    weak var viewController: FixturesListViewController?
    var dataStore: FixturesListDataStore?
    
    // MARK: Routing
    
    func showSelectedFixture(withFixtureIndex: Int)
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
    
    func navigateToConversation(source: FixturesListViewController, destination: ViewController)
    {
        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    func passDataToConversation(source: FixturesListDataStore, destination: inout DataStore)
    {
        destination.value = ""
    }
    */
}
