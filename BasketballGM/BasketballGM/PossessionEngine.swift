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
  case turnover
  case missedFieldGoal
  case timeElapsed(Int) // Note: 24-Second shotclock violation counts as a turnover
}

enum Possession
{
  case home
  case away
}

protocol PossessionEngine
{
  static func runPossession(game: Game, possession: Possession) -> PossessionResult
}
