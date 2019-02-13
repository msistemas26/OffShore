//
//  ResultListCell.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class ResultsListCell: UICollectionViewCell {
    
    @IBOutlet weak var competitionNameLabel: UILabel!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var matchDateNameLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    
    var displayedResult: ResultsList.FetchResults.ViewModel.DisplayedResult!
    
    func setup(withDisplayedResult displayedResult: ResultsList.FetchResults.ViewModel.DisplayedResult) {
        self.displayedResult = displayedResult
        showData()
        setThemes()
    }
    
    private func showData() {
        if let name = displayedResult.competitionName {
            competitionNameLabel.text = name
        }
        if let venueName = displayedResult.venueName {
            venueNameLabel.text = venueName
        }
        if let matchDate = displayedResult.matchDate {
            matchDateNameLabel.text = matchDate
        }
        if let homeTeamName = displayedResult.homeTeamName {
            homeTeamNameLabel.text = homeTeamName
        }
        if let awayTeamName = displayedResult.awayTeamName {
            awayTeamNameLabel.text = awayTeamName
        }
        if let homeScore = displayedResult.homeScore {
            homeScoreLabel.text = homeScore
        }
        if let awayScore = displayedResult.awayScore {
            awayScoreLabel.text = awayScore
        }
        
    }
    
    private func setThemes() {
        competitionNameLabel.textColor = DefaultColors.blackColor
        venueNameLabel.textColor = DefaultColors.greyColor
        matchDateNameLabel.textColor = DefaultColors.greyColor
        homeTeamNameLabel.textColor = DefaultColors.blueColor
        awayTeamNameLabel.textColor = DefaultColors.blueColor
        homeScoreLabel.textColor = DefaultColors.blueColor
        awayScoreLabel.textColor = DefaultColors.blueColor
        
        competitionNameLabel.font = DefaultFonts.regular
        venueNameLabel.font = DefaultFonts.small
        matchDateNameLabel.font = DefaultFonts.small
        homeTeamNameLabel.font = DefaultFonts.medium
        awayTeamNameLabel.font = DefaultFonts.medium
        homeScoreLabel.font = DefaultFonts.score
        awayScoreLabel.font = DefaultFonts.score
        
        if displayedResult.isDraw {
            homeScoreLabel.textColor = DefaultColors.blueColor
            awayScoreLabel.textColor = DefaultColors.blueColor
        } else {
            if displayedResult.isHomeWinner {
                homeScoreLabel.textColor = DefaultColors.lightBlueColor
                awayScoreLabel.textColor = DefaultColors.blueColor
            } else {
                homeScoreLabel.textColor = DefaultColors.blueColor
                awayScoreLabel.textColor = DefaultColors.lightBlueColor
            }
        }
    }
}
