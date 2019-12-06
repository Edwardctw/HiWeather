//
//  CurrentCondition.swift
//  HiWeather
//
//  Created by edward chow on 27/11/19.
//  Copyright © 2019 edward chow. All rights reserved.
//

import Foundation

struct currentCondition : Codable{
    let observationTime, tempC, tempF, weatherCode: String?
       let weatherIconURL, weatherDesc: [Weather]?
       let windspeedMiles, windspeedKmph, winddirDegree, winddir16Point: String?
       let precipMM, precipInches, humidity, visibility: String?
       let visibilityMiles, pressure, pressureInches, cloudcover: String?
       let feelsLikeC, feelsLikeF: String?
       let uvIndex: Int?

       enum CodingKeys: String, CodingKey {
           case observationTime = "observation_time"
           case tempC = "temp_C"
           case tempF = "temp_F"
           case weatherCode
           case weatherIconURL = "weatherIconUrl"
           case weatherDesc, windspeedMiles, windspeedKmph, winddirDegree, winddir16Point, precipMM, precipInches, humidity, visibility, visibilityMiles, pressure, pressureInches, cloudcover
           case feelsLikeC = "FeelsLikeC"
           case feelsLikeF = "FeelsLikeF"
           case uvIndex
       }
    init(observationTime: String, tempC: String, tempF: String, weatherCode: String,
        weatherIconURL: Array<Weather>,weatherDesc: Array<Weather>, windspeedMiles: String,
        windspeedKmph: String, winddirDegree:String, winddir16Point: String, precipMM: String,
        precipInches: String, humility: String, visibility: String, visibilityMiles: String,
        pressure: String, pressureInches: String, cloudcover: String, feelsLikeC: String, feelsLikeF: String,uvIndex: Int){
        
        self.observationTime = observationTime
        self.tempC = tempC
        self.tempF = tempF
        self.weatherCode = weatherCode
        self.weatherIconURL = weatherIconURL
        self.weatherDesc = weatherDesc
        self.windspeedMiles = windspeedMiles
        self.windspeedKmph = windspeedKmph
        self.winddirDegree = winddirDegree
        self.winddir16Point = winddir16Point
        self.precipMM = precipMM
        self.precipInches = precipInches
        self.humidity = humility
        self.visibility = visibility
        self.visibilityMiles = visibilityMiles
        self.pressure = pressure
        self.pressureInches = pressureInches
        self.cloudcover = cloudcover
        self.feelsLikeC = feelsLikeC
        self.feelsLikeF = feelsLikeF
        self.uvIndex = uvIndex
        
    }
   
}
