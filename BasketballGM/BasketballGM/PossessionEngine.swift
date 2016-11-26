//
//  PossessionEngine.swift
//  BasketballGM
//
//  Created by Raymond Brion on 23/11/2016.
//  Copyright © 2016 Raymond Brion. All rights reserved.
//

enum PossessionResult
{
  case scored(Int)
  case turnover(DefensiveResult)
  case missedFieldGoal
  case timeElapsed(Int) // Note: 24-Second shotclock violation counts as a turnover
  case reset
}

enum DefensiveResult
{
  case steal
  case block
}

enum Possession
{
  case home
  case away
}

enum PossessionAction
{
  case drive
  case midRangeShot
  case threePointShot
  case pass
}

protocol PossessionEngine
{
  static func runPossession(game: Game, possession: Possession) -> PossessionResult
}
