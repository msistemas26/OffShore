//
//  ResultsListModels.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

enum ResultsList
{
    // MARK: Use cases
    enum FetchResults
    {
        struct Request
        {
        }
        struct Response
        {
            var fetchedResults: [Result]
        }
        struct ViewModel
        {
            struct DisplayedResult
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
                let homeScore: String?
                let awayScore: String?
                let isHomeWinner: Bool
                let isDraw: Bool
            }
            var displayedResults: [DisplayedResult]
        }
    }
}
