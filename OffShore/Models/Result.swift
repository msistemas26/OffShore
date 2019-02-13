//
//  Result.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright © 2019 Raul Mantilla Assia. All rights reserved.
//

import Foundation

struct Result : Codable {
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
    struct Score : Codable {
        let home: Int
        let away: Int
        let winner: String?
        
        func isHomeWinner() -> Bool {
            switch winner {
            case "home":
                return true
            default:
                return false
            }
        }
        
        func isDraw() -> Bool {
            return home == away
        }
    }
    let id: Int?
    let type: String?
    let date: String?
    let state: String?
    let homeTeam: HomeTeam?
    let awayTeam: AwayTeam?
    let competitionStage: CompetitionStage?
    let venue: Venue?
    let score: Score?
}
