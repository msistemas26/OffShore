//
//  FixturesListCell.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class FixturesListCell: UICollectionViewCell {
    
    @IBOutlet weak var competitionNameLabel: UILabel!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var matchDateNameLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var matchMonthLabel: UILabel!
    @IBOutlet weak var matchDayLabel: UILabel!
    @IBOutlet weak var postponedStateLabel: UILabel!
    
    var displayedFixture: FixturesList.FetchFixtures.ViewModel.DisplayedFixture!
    
    func setup(withDisplayedFixture displayedFixture: FixturesList.FetchFixtures.ViewModel.DisplayedFixture) {
        self.displayedFixture = displayedFixture
        showData()
        setThemes()
    }
    
    private func showData() {
        if let name = displayedFixture.competitionName {
            competitionNameLabel.text = name
        }
        if let venueName = displayedFixture.venueName {
            venueNameLabel.text = venueName
        }
        if let matchDate = displayedFixture.matchDate {
            matchDateNameLabel.text = matchDate
        }
        if let homeTeamName = displayedFixture.homeTeamName {
            homeTeamNameLabel.text = homeTeamName
        }
        if let awayTeamName = displayedFixture.awayTeamName {
            awayTeamNameLabel.text = awayTeamName
        }
        if let matchDayName = displayedFixture.matchDayName {
            matchMonthLabel.text = matchDayName
        }
        if let matchDay = displayedFixture.matchDay {
            matchDayLabel.text = matchDay
        }
        postponedStateLabel.isHidden = true
        if displayedFixture.isPostponed == true,
            let postponed = displayedFixture.status
        {
            postponedStateLabel.text = postponed
            postponedStateLabel.isHidden = false
        }
        
    }
    
    private func setThemes() {
        competitionNameLabel.textColor = DefaultColors.blackColor
        venueNameLabel.textColor = DefaultColors.greyColor
        homeTeamNameLabel.textColor = DefaultColors.blueColor
        awayTeamNameLabel.textColor = DefaultColors.blueColor
        matchMonthLabel.textColor = DefaultColors.blueColor
        matchDayLabel.textColor = DefaultColors.blueColor
        postponedStateLabel.textColor = .white
        postponedStateLabel.backgroundColor = DefaultColors.redColor
        
        competitionNameLabel.font = DefaultFonts.regular
        venueNameLabel.font = DefaultFonts.small
        matchDateNameLabel.font = DefaultFonts.small
        homeTeamNameLabel.font = DefaultFonts.medium
        awayTeamNameLabel.font = DefaultFonts.medium
        matchMonthLabel.font = DefaultFonts.medium
        matchDayLabel.font = DefaultFonts.hight
        postponedStateLabel.font = DefaultFonts.small
        if let isPostponed = displayedFixture.isPostponed {
            matchDateNameLabel.textColor = isPostponed ? DefaultColors.redColor : DefaultColors.greyColor
        }
    }
}
