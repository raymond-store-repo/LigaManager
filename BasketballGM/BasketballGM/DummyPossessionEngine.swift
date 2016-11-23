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
  static func runPossession(game: Game) -> PossessionResult
  {
    let randomShit = randomInt(min:0, max:1)
    var result: PossessionResult
    
    switch randomShit {
    case 0:
      let randomScore = randomInt(min:1, max:3)
      result = .scored(randomScore)
    case 1:
      result = .missedFieldGoal
    default:
      result = .turnover
    }
    return result
  }
  
  private static func randomInt(min: Int, max:Int) -> Int
  {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
  }
}
