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
        NavigationView {
            ScrollView {
                VStack {
                    // MARK: - Display Systems
                    // Loop through all of the moving jobs
                    ForEach(0..<model.movingJobsList.count) { index in
                        
                        NavigationLink(
                            destination:
                                JobDetail()
                                    .onAppear(perform: {
                                        model.beginJob(index)
                                    }),
                            label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                    Text(model.movingJobsList[index].client)
                                        .foregroundColor(.white)
                                }
                            })
                        
                        // Create a NavigationLink button to jump to another View from here
                       
                        
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
