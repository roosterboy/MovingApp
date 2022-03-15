//
//  MovingJob.swift
//  MovingApp
//
//  Created by Leone on 3/14/22.
//

import Foundation

struct MovingJob: Identifiable, Decodable {
  var id: Int
  var client: String
  var moverName: String
  var items: [String: Bool]
}
