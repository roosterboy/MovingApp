//
//  JobDetail.swift
//  MovingApp
//
//  Created by Leone on 3/14/22.
//

import SwiftUI

struct JobDetail: View {
    @EnvironmentObject var model: MoveViewModel
    
    @State var itemMoved: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if model.currentJob != nil {
                    let keys = model.currentJob!.items.map{$0.key}
                    let values = model.currentJob!.items.map {$0.value}
                    
                    ForEach(keys.indices, id: \.self) { index in
                        if model.currentJob!.items[keys[index]] ?? true {
                            Button("\(keys[index])") {
                                // Change the status of the item moved
                                model.currentJob!.items[keys[index]] = false
                                
                            }
                            .foregroundColor(.green)
                        }
                        // Else the item has not been moved yet
                        else {
                            Button("\(keys[index])") {
                                // Change the status of the item moved to false
                                model.currentJob!.items[keys[index]] = true
                                
                            }
                            .foregroundColor(.red)
                        }
                        
                    }
                }
                else {
                    Text("Has not loaded current job")
                }
            }
        }
    }
}

struct JobDetail_Previews: PreviewProvider {
    static var previews: some View {
        JobDetail()
    }
}
