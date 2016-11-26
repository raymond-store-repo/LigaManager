//
//  Team.swift
//  BasketballGM
//
//  Created by Raymond Brion on 23/11/2016.
//  Copyright © 2016 Raymond Brion. All rights reserved.
//

import Foundation

class Team: CustomDebugStringConvertible
{
  private let players: [Player]
  
  let onCourtPlayers: [Player]
  
  init()
  {
    var createdPlayers: [Player] = []
    for _ in 1...12
    {
      let player = Player()
      createdPlayers.append(player)
    }
    players = createdPlayers
    onCourtPlayers = Array(players.prefix(5))
  }
  
  var debugDescription: String
  {
    var description = ""
    for player in players
    {
      description += "\(player.debugDescription)"
    }
    return description
  }
}
