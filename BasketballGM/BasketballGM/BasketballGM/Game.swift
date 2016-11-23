//
//  Game.swift
//  BasketballGM
//
//  Created by Raymond Brion on 23/11/2016.
//  Copyright © 2016 Raymond Brion. All rights reserved.
//

protocol Game
{
  var homeScore: Int { get }
  var awayScore: Int { get }
  
  var timeElapsed: Int { get set }
  
  var quarter: Int { get set }
  
  func addTimeElapsed(time: Int)
  func addHomeScore(score: Int)
  func addAwayScore(score: Int)
  func moveToNextQuarter()
  
  func play()
}
