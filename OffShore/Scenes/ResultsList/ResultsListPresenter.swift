//
//  ResultsListPresenter.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol ResultsListPresentationLogic
{
     func presentResults(response: ResultsList.FetchResults.Response)
}

class ResultsListPresenter: ResultsListPresentationLogic
{
     weak var viewController: ResultsListDisplayLogic?
  
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
        return formatter
    }()
    
    lazy var visibleDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, YYYY 'at' HH:mm"
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        return formatter
    }()
    
    lazy var visibleDayNameFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        return formatter
    }()
    
     // MARK: Methods
  
     func presentResults(response: ResultsList.FetchResults.Response)
     {
        let calendar = Calendar.current
        var fetchedResults: [ResultsList.FetchResults.ViewModel.DisplayedResult] = []
        for fetchedResult in response.fetchedResults
        {
            if let date_ = fetchedResult.date, let date = dateFormatter.date(from:date_)  {
                let components = calendar.dateComponents([.month, .day], from: date)
                let day = components.day
                let dateString = visibleDateFormatter.string(from: date)
                let competitionName = fetchedResult.competitionStage?.competition.name?.uppercased()
                let venueName = fetchedResult.venue?.name
                let homeTeamName = fetchedResult.homeTeam?.name
                let awayTeamName = fetchedResult.awayTeam?.name
                let matchDayName = visibleDayNameFormatter.string(from: date)
                let homeScore = fetchedResult.score?.home ?? 0
                let awayScore = fetchedResult.score?.away ?? 0
                let isHomeWinner = fetchedResult.score?.isHomeWinner() ?? false
                let isDraw = fetchedResult.score?.isDraw() ?? false
                let matchDay = String(day ?? 0)
                let fetchedResult = ResultsList.FetchResults.ViewModel.DisplayedResult(id: fetchedResult.id, competitionName: competitionName, venueName: venueName, matchDate: dateString, homeTeamName: homeTeamName, awayTeamName: awayTeamName, matchDayName: matchDayName.uppercased(), matchDay: matchDay, status: fetchedResult.state, homeScore: String(homeScore), awayScore: String(awayScore), isHomeWinner: isHomeWinner, isDraw: isDraw)
                
                fetchedResults.append(fetchedResult)
            }
        }
        let viewModel = ResultsList.FetchResults.ViewModel(displayedResults: fetchedResults)
        viewController?.displayResults(viewModel: viewModel)
     }
}
