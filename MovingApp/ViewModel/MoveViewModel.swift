//
//  MoveViewModel.swift
//  MovingApp
//
//  Created by Leone on 3/14/22.
//

import Foundation


class MoveViewModel: ObservableObject {
    
    @Published var movingJobsList = [MovingJob]()
    
    init() {
        // Load the patients from the JSON file
        loadSampleJobs()
    }
    
    //we take the list of all possible MovinngJobs (defined
    //in a static property on MovingJob) and subtract all the items
    //from the given MovingJob
    //then sort and return as an Array
    func getUnmovedItems(for job: MovingJob) -> [String] {
        MovingJob.allItems.subtracting(job.items).sorted()
    }
    
    /**
     Loads the sample jobs from the configuration file.
     */
    func loadSampleJobs() {
        //using a guard here means we don't have to check pathString != nil
        //and we don't have to force unwrap it
        //and it removes one level of indentation from the rest of the function
        guard let pathString = Bundle.main.path(forResource: "MovingData", ofType: "json") else {
            //if this fails, just return from the function
            //movingJobsList will remain unchanged
            return
        }
        
        // Create a URL object with the string path to our local JSON file
        let url = URL(fileURLWithPath: pathString)
        
        do {
            // Create data object, pointing it to our local JSON file
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            //here is where, if you renamed the items field in the JSON
            //as mentioned in MovingJob.swift, you would use
            //decoder.keyDecodingStrategy = .convertFromSnakeCase
            
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
