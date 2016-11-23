//
//  RandomNumberGenerator.swift
//  BasketballGM
//
//  Created by Raymond Brion on 23/11/2016.
//  Copyright © 2016 Raymond Brion. All rights reserved.
//

import Foundation

class RandomNumberGenerator
{
  static func randomInt(max:Int) -> Int
  {
    return randomInt(min: 0, max: max)
  }
  
  static func randomInt(min: Int, max:Int) -> Int
  {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
  }
}
