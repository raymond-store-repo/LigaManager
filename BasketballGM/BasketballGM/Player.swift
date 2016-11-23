//
//  Player.swift
//  BasketballGM
//
//  Created by Raymond Brion on 23/11/2016.
//  Copyright © 2016 Raymond Brion. All rights reserved.
//

import Foundation

class Player: CustomStringConvertible, CustomDebugStringConvertible
{
  var name: String
  
  var closeRangeRating: Int
  var midRangeRating: Int
  var longRangeRating: Int
  var freeThrowRating: Int
  
  var reboundRating: Int
  var blockRating: Int
  var stealRating: Int
  
  init()
  {
    name = NameGenerator.generateFirstName() + " " + NameGenerator.generateLastName()
    
    closeRangeRating = RandomNumberGenerator.randomInt(max: 99)
    midRangeRating = RandomNumberGenerator.randomInt(max: 99)
    longRangeRating = RandomNumberGenerator.randomInt(max: 99)
    freeThrowRating = RandomNumberGenerator.randomInt(max: 99)
    
    reboundRating = RandomNumberGenerator.randomInt(max: 99)
    blockRating = RandomNumberGenerator.randomInt(max: 99)
    stealRating = RandomNumberGenerator.randomInt(max: 99)
  }
  
  var description: String
  {
    return name
  }
  
  var debugDescription: String
  {
    return (  name
            + "CRR: \(closeRangeRating)"
            + "MRR: \(midRangeRating)"
            + "LRR: \(longRangeRating)"
            + "FTR: \(freeThrowRating)"
            + "RR: \(reboundRating)"
            + "BR: \(blockRating)"
            + "SR: \(stealRating)")
  }
}
