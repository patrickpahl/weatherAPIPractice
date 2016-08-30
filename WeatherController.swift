//
//  WeatherController.swift
//  WeatherApp72116
//
//  Created by Patrick Pahl on 7/21/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import Foundation
//http://api.openweathermap.org/data/2.5/weather?q=London&APPID=545220e5abf77c2a88c5e5634adc4446

class WeatherController {
    
    static private let apiKey = "545220e5abf77c2a88c5e5634adc4446"
    static let baseURL = NSURL(string: "http://api.openweathermap.org/data/2.5/weather")
    //No .json required at the end. Some APIs do.
    
    //static instead of singleton, bc the instance doesn't matter.
    
    static func getWeather(cityName: String, completion: (weather: Weather?) -> Void) {
        //, error: NSError? - removed
        
        //completion is going to bring stuff back when it has completed running. Weather is optional, bc we may not get something back.
        
        guard let url = baseURL else {
            //Unwrap url bc is optional. MUST make baseURL static so we can access it here.
            completion(weather: nil)    //,error: nil - removed
            return
        }
        
        let params = ["q":"\(cityName)", "appid":WeatherController.apiKey]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: params, body: nil) { (data, error) in
            
             //SERIALIZE DATA
            guard let data = data,
                jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String:AnyObject] else {
                    
                    completion(weather: nil)
                    return
            }
            dispatch_async(dispatch_get_main_queue(), { 
                let weather = Weather(dictionary: jsonDictionary)
                completion(weather: weather)
                print(weather?.description)
            })
        }
    }
    
}

//NOTES:
//A/B
//func
//unwrap
//params
//PerformRequest
//Serialize
//dispatch

