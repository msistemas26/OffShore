//
//  Fixture.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright © 2019 Raul Mantilla Assia. All rights reserved.
//

import Foundation

struct Fixture : Codable {
    struct HomeTeam : Codable {
        let id: Int
        let name: String?
        let shortName: String?
        let abbr: String?
        let alias: String?
    }
    struct AwayTeam : Codable {
        let id: Int
        let name: String?
        let shortName: String?
        let abbr: String?
        let alias: String?
    }
    struct CompetitionStage : Codable {
        struct Competition : Codable {
            let id: Int
            let name: String?
        }
        let competition: Competition
    }
    struct Venue : Codable {
        let id: Int
        let name: String?
    }
    let id: Int?
    let type: String?
    let date: String?
    let state: String?
    let homeTeam: HomeTeam?
    let awayTeam: AwayTeam?
    let competitionStage: CompetitionStage?
    let venue: Venue?
    
    func isPostponed() -> Bool {
        switch state {
        case "postponed":
            return true
        default:
            return false
        }
    }
}

