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
  var awayScore = 0
  var homeScore = 0
  var timeElapsed = 0
  var quarter = 1
  
  var possessionCount = 0
  
  func addTimeElapsed(time: Int)
  {
    timeElapsed += time
  }
  
  func addHomeScore(score: Int)
  {
    if (score > 0)
    {
      print("Home scored!! \(score)")
      print("Score \(homeScore) - \(awayScore)")
    }
    homeScore += score
  }
  
  func addAwayScore(score: Int)
  {
    if (score > 0)
    {
      print("Away scored!! \(score)")
      print("Score \(homeScore) - \(awayScore)")
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
        let result = DummyPossessionEngine.runPossession(game: self)
        let score = evaluateResult(result: result)
        
        if (possessionCount % 2 == 0)
        {
          print("Home finised possession");
          addHomeScore(score: score)
        }
        else
        {
          print("Away finished possession");
          addAwayScore(score: score)
        }
        
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
      default:
        score = 0
    }
    
    return score
  }
}
