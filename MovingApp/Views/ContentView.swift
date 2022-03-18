//
//  ContentView.swift
//  MovingApp
//
//  Created by Leone on 3/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: MoveViewModel
    
    var body: some View {
        NavigationView { //pretty nifty
            ScrollView { //how these
                VStack { //lined up!
                    // MARK: - Display Systems
                    // Loop through all of the MovingJobs
                    ForEach($model.movingJobsList) { $job in
                        
                        NavigationLink {
                            JobDetail(job: $job)
                            //instead of relying on a currentJob property in
                            //the view model, we just pass a binding to the job
                            //we want to work with
                        } label: {
                            Text(job.client)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.teal, in: RoundedRectangle(cornerRadius: 10))
                                //IMO, this modifier is nicer than using a ZStack with a RoundRectangle
                                //behind some Text
                                //it's cleaner and easier to see exactly what effect is desired
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Current Jobs")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MoveViewModel())

    }
}
