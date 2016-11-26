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
    var result: PossessionResult
    let playerPair = randomPlayerPair(game: game, possession: possession)
    let offensePlayer = playerPair.offense
    let defensePlayer = playerPair.defense
    
    print("\(offensePlayer) matched up against \(defensePlayer)")
    
    let playerAction = randomAction(player: offensePlayer)
    
    switch playerAction
    {
      case .drive:
        print("\(offensePlayer) decides to drive")
        let dribbleResult = simulateAction(offensiveRating: offensePlayer.dribbleRating,
                                           defensiveRating: defensePlayer.stealRating,
                                           isShot: false)
        if (dribbleResult.defenseSuccess)
        {
          //STEAL!
          result = .turnover(.steal)
        }
        else if (!dribbleResult.offenseSuccess)
        {
          //STEAL!
          result = .turnover(.steal)
        }
        else
        {
          let driveResult = simulateAction(offensiveRating: offensePlayer.closeRangeRating,
                                           defensiveRating: defensePlayer.blockRating,
                                           isShot: true)
          
          if (driveResult.defenseSuccess)
          {
            //BLOCK!
            result = .turnover(.block)
          }
          else if (!dribbleResult.offenseSuccess)
          {
            //MISSED!
            result = .missedFieldGoal
          }
          else
          {
            //SCORE!
            result = .scored(2)
          }
        }
      
      case .midRangeShot:
        print("\(offensePlayer) decides to shoot a mid-range shot")
        let shotResult = simulateAction(offensiveRating: offensePlayer.midRangeRating,
                                        defensiveRating: defensePlayer.blockRating,
                                        isShot: true)
        
        if (shotResult.defenseSuccess)
        {
          //BLOCK!
          result = .turnover(.block)
        }
        else if (!shotResult.offenseSuccess)
        {
          //MISSED!
          result = .missedFieldGoal
        }
        else
        {
          //SCORE!
          result = .scored(2)
        }
    case .threePointShot:
      print("\(offensePlayer) decides to shoot a long-range shot")
      let shotResult = simulateAction(offensiveRating: offensePlayer.longRangeRating,
                                      defensiveRating: defensePlayer.blockRating,
                                      isShot: true)
      
      if (shotResult.defenseSuccess)
      {
        //BLOCK!
        result = .turnover(.block)
      }
      else if (!shotResult.offenseSuccess)
      {
        //MISSED!
        result = .missedFieldGoal
      }
      else
      {
        //SCORE!
        result = .scored(3)
      }
      
    case .pass:
      print("\(offensePlayer) decides to pass")
      let passResult = simulateAction(offensiveRating: offensePlayer.longRangeRating,
                                      defensiveRating: defensePlayer.stealRating,
                                      isShot: false)
      
      if (passResult.defenseSuccess)
      {
        //STEAL!
        result = .turnover(.block)
      }
      else if (!passResult.offenseSuccess)
      {
        //TURNOVER! //TODO: Self turnover or steal
        result = .turnover(.steal)
      }
      else
      {
        //SCORE!
        // TODO: Let's make sure the player does not end up again on the next possession
        result = runPossession(game: game, possession: possession)
      }
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
  
  private static func randomAction(player: Player) -> PossessionAction
  {
    let magicNumber = RandomNumberGenerator.randomInt(max: 3)
    let action: PossessionAction
    
    // TODO base it on the tendencies
    
    switch magicNumber
    {
      case 0:
        action = .drive
      case 1:
        action = .midRangeShot
      case 2:
        action = .threePointShot
      default:
        action = .pass
    }
    return action
  }
  
  private static func simulateAction(offensiveRating: Int, defensiveRating: Int, isShot: Bool) -> (offenseSuccess:Bool, defenseSuccess:Bool)
  {
    let wildcard = isShot ? Float(0.7) : Float(0.95)
    
    let offensiveChances = ceil(Float(offensiveRating) * wildcard)
    let defensiveChances = ceil(Float(defensiveRating) * 0.2) //20% Chances
    
    let randomDefenseShit = Float(RandomNumberGenerator.randomInt(max: 100))
    let randomOffenseShit = Float(RandomNumberGenerator.randomInt(max: 100))
    
    
    // TODO: Let's make it an enum rather than a tuple
    if (randomDefenseShit <= defensiveChances)
    {
      return (false, true)
    }
    else if (randomOffenseShit <= offensiveChances)
    {
      return (true, false)
    }
    else
    {
      return (false, false)
    }
  }
}
