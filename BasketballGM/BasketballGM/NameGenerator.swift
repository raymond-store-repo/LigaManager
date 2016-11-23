//
//  NameGenerator.swift
//  BasketballGM
//
//  Created by Raymond Brion on 23/11/2016.
//  Copyright © 2016 Raymond Brion. All rights reserved.
//

import Foundation

class NameGenerator
{
  static func generateFirstName() -> String
  {
    let names = ["Kobe", "Kevin", "Stephen", "Russell", "Derrick", "Klay", "Steven", "Michael", "LeBron", "Kyrie"]
    return names[RandomNumberGenerator.randomInt(max: names.count - 1)]
  }
  
  static func generateLastName() -> String
  {
    let names = ["Bryant", "Durant", "Curry", "Westbrook", "Rose", "Thompson", "Adams", "Jordan", "James", "Irving", "Love"]
    return names[RandomNumberGenerator.randomInt(max: names.count - 1)]
  }
}
