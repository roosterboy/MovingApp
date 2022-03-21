//
//  JobDetail.swift
//  MovingApp
//
//  Created by Leone on 3/14/22.
//

import SwiftUI

struct JobDetail: View {
    @EnvironmentObject var model: MoveViewModel
    
    @Binding var job: MovingJob
    
    var body: some View {
        ScrollView {
            LazyVStack {
                //moved items
                //we can use id: \.self here since we are working with
                //an array of unique strings
                ForEach(job.sortedItems, id: \.self) { item in
                    Button(item) {
                        //clicking this button removes this particular items
                        //from the set of items
                        //which causes our View to redraw
                        job.items.remove(item)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green, in: RoundedRectangle(cornerRadius: 10))
                    //I used a custom ButtonStyle just to be fancy
                }
                //unmoved items
                ForEach(model.getUnmovedItems(for: job), id: \.self) { item in
                    Button(item) {
                        //clicking this button adds this particular items
                        //to the set of items
                        //which causes our View to redraw
                        job.items.insert(item)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red, in: RoundedRectangle(cornerRadius: 10))
                    //I used a custom ButtonStyle just to be fancy
                }
            }
        }
    }
}
