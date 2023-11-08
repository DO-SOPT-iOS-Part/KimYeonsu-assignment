//
//  DetailWeatherData.swift
//  Weather-App
//
//  Created by yeonsu on 11/8/23.
//

import Foundation

struct WeeklyWeatherData {
    let weekDay: String
    let weatherImage: String
    let chanceOfPrecipitation: String?
    let minimumTemperature: String
    let maximumTemperature: String
    
    init(weekDay: String, weatherImage: String, chanceOfPrecipitation: String?, minimumTemperature: String, maximumTemperature: String) {
        self.weekDay = weekDay
        self.weatherImage = weatherImage
        self.chanceOfPrecipitation = chanceOfPrecipitation
        self.minimumTemperature = minimumTemperature
        self.maximumTemperature = maximumTemperature
    }
}

private let weatherImages: [String] = ["􀆮", "􀇅", "􀇕"]

var weeklyWeatherData: [WeeklyWeatherData] = [.init(weekDay: "오늘",
                                                    weatherImage: weatherImages[0],
                                                    chanceOfPrecipitation: nil,
                                                    minimumTemperature: "15°",
                                                    maximumTemperature: "29°"),
                                              .init(weekDay: "월",
                                                    weatherImage: weatherImages[1],
                                                    chanceOfPrecipitation: "60%",
                                                    minimumTemperature: "18°",
                                                    maximumTemperature: "27°"),
                                              .init(weekDay: "화",
                                                    weatherImage: weatherImages[1],
                                                    chanceOfPrecipitation: "60%",
                                                    minimumTemperature: "20°",
                                                    maximumTemperature: "25°"),
                                              .init(weekDay: "수",
                                                    weatherImage: weatherImages[1],
                                                    chanceOfPrecipitation: "70%",
                                                    minimumTemperature: "17°",
                                                    maximumTemperature: "25°"),
                                              .init(weekDay: "목",
                                                    weatherImage: weatherImages[1],
                                                    chanceOfPrecipitation: "50%",
                                                    minimumTemperature: "17°",
                                                    maximumTemperature: "25°"),
                                              .init(weekDay: "금",
                                                    weatherImage: weatherImages[2],
                                                    chanceOfPrecipitation: nil,
                                                    minimumTemperature: "20°",
                                                    maximumTemperature: "26°"),
                                              .init(weekDay: "토",
                                                    weatherImage: weatherImages[0],
                                                    chanceOfPrecipitation: nil,
                                                    minimumTemperature: "18°",
                                                    maximumTemperature: "25°"),
                                              .init(weekDay: "일",
                                                    weatherImage: weatherImages[1],
                                                    chanceOfPrecipitation: "50%",
                                                    minimumTemperature: "13°",
                                                    maximumTemperature: "21°"),
                                              .init(weekDay: "월",
                                                    weatherImage: weatherImages[1],
                                                    chanceOfPrecipitation: "50%",
                                                    minimumTemperature: "12°",
                                                    maximumTemperature: "19°"),
                                              .init(weekDay: "화",
                                                    weatherImage: weatherImages[0],
                                                    chanceOfPrecipitation: nil,
                                                    minimumTemperature: "18°",
                                                    maximumTemperature: "25°"),
                                              .init(weekDay: "수",
                                                    weatherImage: weatherImages[0],
                                                    chanceOfPrecipitation: nil,
                                                    minimumTemperature: "18°",
                                                    maximumTemperature: "25°")]
