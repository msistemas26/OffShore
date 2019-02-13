//
//  FixturesListViewController.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol FixturesListDisplayLogic: class
{
    func displayFixtures(viewModel: FixturesList.FetchFixtures.ViewModel)
}

class FixturesListViewController: UIViewController, FixturesListDisplayLogic
{
    var interactor: FixturesListBusinessLogic?
    var router: (NSObjectProtocol & FixturesListRoutingLogic & FixturesListDataPassing)?
    
    @IBOutlet weak var collectionView: UICollectionView!
    var displayedFixtures: [FixturesList.FetchFixtures.ViewModel.DisplayedFixture] = []
    
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
        let interactor = FixturesListInteractor()
        let presenter = FixturesListPresenter()
        let router = FixturesListRouter()
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
        fetchFixtures()
        setupCollectionView()
    }
    
    // MARK: Methods
    
    func fetchFixtures()
    {
        let request = FixturesList.FetchFixtures.Request()
        interactor?.fetchFixtures(request: request)
    }
    
    func displayFixtures(viewModel: FixturesList.FetchFixtures.ViewModel)
    {
        displayedFixtures = viewModel.displayedFixtures
        collectionView.reloadData()
    }
}


// MARK: - UICollectionView Delegates implementation
extension FixturesListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func setupCollectionView() {
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(UINib(nibName: String(describing: FixturesListCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: FixturesListCell.self))
        collectionView.register(FixturesListViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: FixturesListViewHeader.self))

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return displayedFixtures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let displayedFixture = displayedFixtures[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FixturesListCell.self), for: indexPath) as? FixturesListCell else { return UICollectionViewCell() }
        
        cell.setup(withDisplayedFixture: displayedFixture)
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
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: FixturesListViewHeader.self), for: indexPath) as? FixturesListViewHeader {
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

