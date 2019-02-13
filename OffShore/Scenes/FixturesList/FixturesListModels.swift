//
//  FixturesListModels.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

enum FixturesList
{
    // MARK: Use cases
    enum FetchFixtures
    {
        struct Request
        {
        }
        struct Response
        {
            var fetchedFixtures: [Fixture]
        }
        struct ViewModel
        {
            struct DisplayedFixture
            {
                let id: Int?
                let competitionName: String?
                let venueName: String?
                let matchDate: String?
                let homeTeamName: String?
                let awayTeamName: String?
                let matchDayName: String?
                let matchDay: String?
                let status: String?
                let isPostponed: Bool?
            }
            var displayedFixtures: [DisplayedFixture]
        }
    }
}
