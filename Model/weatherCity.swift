//
//  weatherCity.swift
//  HiWeather
//
//  Created by edward chow on 26/11/19.
//  Copyright © 2019 edward chow. All rights reserved.
//

import Foundation


struct weatherCity: Codable{
    let data: DataClass?
}
// MARK: - DataClass
struct DataClass: Codable {
    let request: [Request]?
    let currentCondition: [CurrentCondition]?
    let weather: [WeatherElement]?
    let climateAverages: [ClimateAverage]?

    enum CodingKeys: String, CodingKey {
        case request
        case currentCondition = "current_condition"
        case weather
        case climateAverages = "ClimateAverages"
    }
}

// MARK: - ClimateAverage
struct ClimateAverage: Codable {
    let month: [Month]?
}

// MARK: - Month
struct Month: Codable {
    let index, name, avgMinTemp, avgMinTempF: String?
    let avgMaxTemp, avgMaxTempF, absMinTemp, absMinTempF: String?
    let absMaxTemp, absMaxTempF, avgTemp, avgTempF: String?
    let maxWindSpeedKmph, maxWindSpeedMph, maxWindSpeedKnots, maxWindSpeedMS: String?
    let avgWindSpeedKmph, avgWindSpeedMph, avgWindSpeedKnots, avgWindSpeedMS: String?
    let avgWindGustKmph, avgWindGustMph, avgWindGustKnots, avgWindGustMS: String?
    let avgDailyRainfall, avgDailyRainfallInch, avgMonthlyRainfall, avgMonthlyRainfallInch: String?
    let avgHumidity, avgCloud, avgVisKM, avgVisMiles: String?
    let avgPressureMB, avgPressureInch, avgDryDays, avgRainDays: String?
    let avgSnowDays, avgFogDays, avgThunderDays, avgUVIndex: String?
    let avgSunHour: String?

    enum CodingKeys: String, CodingKey {
        case index, name, avgMinTemp
        case avgMinTempF = "avgMinTemp_F"
        case avgMaxTemp
        case avgMaxTempF = "avgMaxTemp_F"
        case absMinTemp
        case absMinTempF = "absMinTemp_F"
        case absMaxTemp
        case absMaxTempF = "absMaxTemp_F"
        case avgTemp
        case avgTempF = "avgTemp_F"
        case maxWindSpeedKmph = "maxWindSpeed_kmph"
        case maxWindSpeedMph = "maxWindSpeed_mph"
        case maxWindSpeedKnots = "maxWindSpeed_knots"
        case maxWindSpeedMS = "maxWindSpeed_ms"
        case avgWindSpeedKmph = "avgWindSpeed_kmph"
        case avgWindSpeedMph = "avgWindSpeed_mph"
        case avgWindSpeedKnots = "avgWindSpeed_knots"
        case avgWindSpeedMS = "avgWindSpeed_ms"
        case avgWindGustKmph = "avgWindGust_kmph"
        case avgWindGustMph = "avgWindGust_mph"
        case avgWindGustKnots = "avgWindGust_knots"
        case avgWindGustMS = "avgWindGust_ms"
        case avgDailyRainfall
        case avgDailyRainfallInch = "avgDailyRainfall_inch"
        case avgMonthlyRainfall
        case avgMonthlyRainfallInch = "avgMonthlyRainfall_inch"
        case avgHumidity, avgCloud
        case avgVisKM = "avgVis_km"
        case avgVisMiles = "avgVis_miles"
        case avgPressureMB = "avgPressure_mb"
        case avgPressureInch = "avgPressure_inch"
        case avgDryDays, avgRainDays, avgSnowDays, avgFogDays, avgThunderDays, avgUVIndex, avgSunHour
    }
}

// MARK: - CurrentCondition
struct CurrentCondition: Codable {
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
}

// MARK: - Weather
struct Weather: Codable {
    let value: String?
}

// MARK: - Request
struct Request: Codable {
    let type, query: String?
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let date: String?
    let astronomy: [Astronomy]?
    let maxtempC, maxtempF, mintempC, mintempF: String?
    let avgtempC, avgtempF, totalSnowCM, sunHour: String?
    let uvIndex: String?
    let hourly: [Hourly]?

    enum CodingKeys: String, CodingKey {
        case date, astronomy, maxtempC, maxtempF, mintempC, mintempF, avgtempC, avgtempF
        case totalSnowCM = "totalSnow_cm"
        case sunHour, uvIndex, hourly
    }
}

// MARK: - Astronomy
struct Astronomy: Codable {
    let sunrise, sunset, moonrise, moonset: String?
    let moonPhase, moonIllumination: String?

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}

// MARK: - Hourly
struct Hourly: Codable {
    let time, tempC, tempF, windspeedMiles: String?
    let windspeedKmph, winddirDegree, winddir16Point, weatherCode: String?
    let weatherIconURL, weatherDesc: [Weather]?
    let precipMM, precipInches, humidity, visibility: String?
    let visibilityMiles, pressure, pressureInches, cloudcover: String?
    let heatIndexC, heatIndexF, dewPointC, dewPointF: String?
    let windChillC, windChillF, windGustMiles, windGustKmph: String?
    let feelsLikeC, feelsLikeF, chanceofrain, chanceofremdry: String?
    let chanceofwindy, chanceofovercast, chanceofsunshine, chanceoffrost: String?
    let chanceofhightemp, chanceoffog, chanceofsnow, chanceofthunder: String?
    let uvIndex: String?

    enum CodingKeys: String, CodingKey {
        case time, tempC, tempF, windspeedMiles, windspeedKmph, winddirDegree, winddir16Point, weatherCode
        case weatherIconURL = "weatherIconUrl"
        case weatherDesc, precipMM, precipInches, humidity, visibility, visibilityMiles, pressure, pressureInches, cloudcover
        case heatIndexC = "HeatIndexC"
        case heatIndexF = "HeatIndexF"
        case dewPointC = "DewPointC"
        case dewPointF = "DewPointF"
        case windChillC = "WindChillC"
        case windChillF = "WindChillF"
        case windGustMiles = "WindGustMiles"
        case windGustKmph = "WindGustKmph"
        case feelsLikeC = "FeelsLikeC"
        case feelsLikeF = "FeelsLikeF"
        case chanceofrain, chanceofremdry, chanceofwindy, chanceofovercast, chanceofsunshine, chanceoffrost, chanceofhightemp, chanceoffog, chanceofsnow, chanceofthunder, uvIndex
    }
}
