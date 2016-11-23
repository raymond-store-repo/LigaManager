//
//  DummyPossessionEngine.swift
//  BasketballGM
//
//  Created by Raymond Brion on 23/11/2016.
//  Copyright © 2016 Raymond Brion. All rights reserved.
//

import Foundation

class DummyPossessionEngine: PossessionEngine
{
  static func runPossession(game: Game, possession: Possession) -> PossessionResult
  {
    let randomShit = RandomNumberGenerator.randomInt(min:0, max:1)
    var result: PossessionResult
    let playerPair = randomPlayerPair(game: game, possession: possession)
    let offensePlayer = playerPair.offense
    let defensePlayer = playerPair.defense
    
    print("\(offensePlayer) matched up against \(defensePlayer)")
    
    switch randomShit
    {
      case 0:
        let randomScore = RandomNumberGenerator.randomInt(min:1, max:3)
        result = .scored(randomScore)
      case 1:
        result = .missedFieldGoal
      default:
        result = .turnover
    }
    return result
  }
  
  private static func randomPlayerPair(game: Game, possession: Possession) -> (offense: Player, defense: Player)
  {
    let magicNumber = RandomNumberGenerator.randomInt(max: 4)
    if (possession == .home)
    {
      return (game.homeTeam.onCourtPlayers[magicNumber], game.awayTeam.onCourtPlayers[magicNumber])
    }
    else
    {
      return (game.awayTeam.onCourtPlayers[magicNumber], game.homeTeam.onCourtPlayers[magicNumber])
    }
  }
}
