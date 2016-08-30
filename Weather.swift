//
//  Weather.swift
//  WeatherApp72116
//
//  Created by Patrick Pahl on 7/21/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import Foundation

//Struct, not class, bc we don't say what the weather is. We don't initialize.
//We're pulling down data, not referencing it or anything.

struct Weather {
    
    private let NameKey = "name"
    private let WeatherKey = "weather"
    private let DescKey = "description"
    private let MainKey = "main"
    private let TempKey = "temp"
    
    let name: String
    let description: String
    let temp: Float
    var celsius: Float {
        return temp - 273.15
    }
    var fahr: Float {
        return celsius * 1.8 + 32
    }
    
    init?(dictionary: [String:AnyObject]){
        
        guard let name = dictionary[NameKey] as? String else { return nil }
        
        guard let weatherArray = dictionary[WeatherKey] as? [[String:AnyObject]],
        let weatherDictionary = weatherArray.first,
        desc = weatherDictionary[DescKey] as? String else { return nil }
        
        guard let mainDictionary = dictionary[MainKey] as? [String:AnyObject],
            temp = mainDictionary[TempKey] as? Float else {return nil}
        
        self.name = name
        self.description = desc
        self.temp = temp
    }
    
    
}