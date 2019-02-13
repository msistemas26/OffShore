//
//  ResultsListViewController.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol ResultsListDisplayLogic: class
{
    func displayResults(viewModel: ResultsList.FetchResults.ViewModel)
}

class ResultsListViewController: UIViewController, ResultsListDisplayLogic
{
    var interactor: ResultsListBusinessLogic?
    var router: (NSObjectProtocol & ResultsListRoutingLogic & ResultsListDataPassing)?
    
    @IBOutlet weak var collectionView: UICollectionView!
    var displayedResults: [ResultsList.FetchResults.ViewModel.DisplayedResult] = []
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = ResultsListInteractor()
        let presenter = ResultsListPresenter()
        let router = ResultsListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        fetchResults()
        setupCollectionView()
    }
    
    // MARK: Methods
    
    func fetchResults()
    {
        let request = ResultsList.FetchResults.Request()
        interactor?.fetchResults(request: request)
    }
    
    func displayResults(viewModel: ResultsList.FetchResults.ViewModel)
    {
        displayedResults = viewModel.displayedResults
        collectionView.reloadData()
    }
}


// MARK: - UICollectionView Delegates implementation
extension ResultsListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func setupCollectionView() {
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(UINib(nibName: String(describing: ResultsListCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ResultsListCell.self))
        collectionView.register(ResultsListViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: ResultsListViewHeader.self))

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return displayedResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let displayedResult = displayedResults[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ResultsListCell.self), for: indexPath) as? ResultsListCell else { return UICollectionViewCell() }
        
        cell.setup(withDisplayedResult: displayedResult)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: ResultsListViewHeader.self), for: indexPath) as? ResultsListViewHeader {
                headerView.setTitle(withTitle: "September 2017")
                return headerView
            } else {
                return UICollectionReusableView()
            }
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 80)
    }
}

