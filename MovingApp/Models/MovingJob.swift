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
    var items: Set<String>
    
    //using this approach, I would probably rename items in the JSON
    //to moved_items or unmoved_items (I'm still not exactly sure which
    //it should be) just to make it clearer.
    //you would then rename the property in MovingJob to movedItems
    //or unmovedItems and use .keyDecodingStrategy = .convertFromSnakeCase
    //and .keyEncodingStrategy = .convertToSnakeCase when decoding from/encoding to
    //JSON
    
    //since Sets are unordered, we use this computed property
    //to get the set of items as a sorted array
    var sortedItems: [String] {
        items.sorted()
    }
}

extension MovingJob {
    //this is just so we have a list to work from
    //clearly, you would get this however your app needs to do so
    static let allItems: Set<String> = [
        "redStand",
        "blueTable",
        "glassTable",
        "espressoMachine",
        "grayCouch",
        "brownStand",
    ]
}
