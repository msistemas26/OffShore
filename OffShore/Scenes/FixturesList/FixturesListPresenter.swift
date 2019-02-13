//
//  FixturesListPresenter.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

protocol FixturesListPresentationLogic
{
     func presentFixtures(response: FixturesList.FetchFixtures.Response)
}

class FixturesListPresenter: FixturesListPresentationLogic
{
     weak var viewController: FixturesListDisplayLogic?
    
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
  
     func presentFixtures(response: FixturesList.FetchFixtures.Response)
     {
        let calendar = Calendar.current
        var fetchedFixtures: [FixturesList.FetchFixtures.ViewModel.DisplayedFixture] = []
        for fetchedFixture in response.fetchedFixtures
        {
            if let date_ = fetchedFixture.date, let date = dateFormatter.date(from:date_)  {
                let components = calendar.dateComponents([.month, .day], from: date)
                let day = components.day
                let dateString = visibleDateFormatter.string(from: date)
                let competitionName = fetchedFixture.competitionStage?.competition.name?.uppercased()
                let venueName = fetchedFixture.venue?.name
                let homeTeamName = fetchedFixture.homeTeam?.name
                let awayTeamName = fetchedFixture.awayTeam?.name
                let matchDayName = visibleDayNameFormatter.string(from: date)
                let matchDay = String(day ?? 0)
                let postponedState = fetchedFixture.state
                let isPostPoned = fetchedFixture.isPostponed()
                let displayedFixtures = FixturesList.FetchFixtures.ViewModel.DisplayedFixture(id: fetchedFixture.id, competitionName: competitionName, venueName: venueName, matchDate: dateString, homeTeamName: homeTeamName, awayTeamName: awayTeamName, matchDayName: matchDayName.uppercased(), matchDay: matchDay, status: postponedState?.uppercased(), isPostponed: isPostPoned)
                
                fetchedFixtures.append(displayedFixtures)
            }
        }
        let viewModel = FixturesList.FetchFixtures.ViewModel(displayedFixtures: fetchedFixtures)
        viewController?.displayFixtures(viewModel: viewModel)
     }
}
