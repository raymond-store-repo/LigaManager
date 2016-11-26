//
//  BasketballGame.swift
//  BasketballGM
//
//  Created by Raymond Brion on 23/11/2016.
//  Copyright © 2016 Raymond Brion. All rights reserved.
//

import Foundation

class BasketballGame: Game
{
  var homeTeam: Team
  var awayTeam: Team
  
  var awayScore = 0
  var homeScore = 0
  var timeElapsed = 0
  var quarter = 1
  
  var possessionCount = 0
  
  init()
  {
    /* We still don't have the concept of positions */
    homeTeam = Team()
    awayTeam = Team()
    
    debugPrint("Home Team \(homeTeam)")
    debugPrint("Away Team \(awayTeam)")
  }
  
  func addTimeElapsed(time: Int)
  {
    timeElapsed += time
  }
  
  func addHomeScore(score: Int)
  {
    if (score > 0)
    {
      print("Home scored!! \(score)")
    }
    homeScore += score
  }
  
  func addAwayScore(score: Int)
  {
    if (score > 0)
    {
      print("Away scored!! \(score)")
    }
    awayScore += score
  }
  
  func moveToNextQuarter()
  {
    quarter += 1
  }
  
  func play()
  {
    for quarter in 1...4
    {
      while timeElapsed < quarter * 12 * 60
      {
        let possession = possessionCount % 2 == 0 ? Possession.home : Possession.away;
        
        let result = DummyPossessionEngine.runPossession(game: self, possession: possession)
        let score = evaluateResult(result: result)
        
        if (possession == .home)
        {
          print("Home finised possession");
          addHomeScore(score: score)
        }
        else
        {
          print("Away finished possession");
          addAwayScore(score: score)
        }
        
        /* TODO HERE: DEADBALL/TIMEOUT -> SUBSTITUTION */
        
        possessionCount += 1
        addTimeElapsed(time: 24)
      }
      
      print("End of \(quarter) Quarter. Score \(homeScore) - \(awayScore)")
    }
  }
  
  func evaluateResult(result: PossessionResult) -> Int
  {
    var score = 0
    switch result
    {
      case let .scored(value):
        score = value
      case let .timeElapsed(value):
        score = value
      case let .turnover(defensiveResult):
        score = 0
        print("Turnover! \(defensiveResult)")
      default:
        score = 0
    }
    
    return score
  }
}
