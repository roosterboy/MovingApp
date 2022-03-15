//
//  MoveViewModel.swift
//  MovingApp
//
//  Created by Leone on 3/14/22.
//

import Foundation


class MoveViewModel: ObservableObject {
    
    @Published var movingJobsList = [MovingJob]()
    var currentJobIndex = 0
    @Published var currentJob: MovingJob?
    
    init() {
        // Load the patients from the JSON file
        loadSampleJobs()
    }
    
    /**
     Loads the sample jobs from the configuration file.
     */
    func loadSampleJobs() {
        // Find the path to the JSON file in our bundle
        let pathString = Bundle.main.path(forResource: "MovingData", ofType: "json")
        
        if pathString != nil {
            
            // Create a URL object with the string path to our local JSON file
            let url = URL(fileURLWithPath: pathString!)
            
            do {
                // Create data object, pointing it to our local JSON file
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                do {
                    // Try to decode the json data into a list of System objects
                    let sampleJobs = try decoder.decode([MovingJob].self, from: data)
                                        
                    self.movingJobsList = sampleJobs
                    
                }
                catch {
                    print("Couldn't parse JSON in ViewModel line 51. Full error: \(error)")
                }
                
            }
            catch {
                print("Couldn't create data object line 56 in ViewModel. Full error: \(error)")
            }
            
        }
    }
    
    func beginJob(_ jobIndex:Int) {
        
        if jobIndex < movingJobsList.count {
            
            self.currentJobIndex = jobIndex
        }
        // Else, set it to the first system
        else {
            self.currentJobIndex = 0
        }
        
        // Set the current system under review
        self.currentJob = movingJobsList[jobIndex]
        
    }
    
}
