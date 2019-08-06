import Foundation

// <#Model class for Weather Data#>
class CurrentWeather
{
    // <#We are using here let, because we only use for get data and not editing outsite of this class#>
    // <#?(optional) -> Data can be nil#>
    let temparature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    
    // <#We may be use this variable in lots of place. we make this stucture so that#>
    // <#we can change the name only here and everyhere it will be replaced#>
    struct WeatherKeys {
        static let temarature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
    }
    
    /// <#Initialization#>
    ///
    /// - Parameter weatherDictionary: <#Weather Data#>
    init(weatherDictionary: [String: Any]) {
        
        //temparature = weatherDictionary[WeatherKeys.temarature] as? Int
        
        if let temperatureDouble = weatherDictionary[WeatherKeys.temarature] as? Double{
            temparature = Int(temperatureDouble * 1.0)
        }else{
            temparature = nil
        }
        
        // <#For UI Represention Nicely We are multiplying the data with 100,#>
        // <#because in some case humidity is 0.79, We make it 79.00 for UI Representation#>
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double{
            humidity = Int(humidityDouble * 100)
        }else{
            humidity = nil
        }
        
        if let precipProbabilityDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double{
            precipProbability = Int(precipProbabilityDouble * 100)
        }else{
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
    }
    
    // <#Bellow is the sample JSON Data, Which we are calling by API#>
    /*
    {
    "time":1565063682,
    "summary":"Partly Cloudy",
    "icon":"partly-cloudy-night",
    "nearestStormDistance":16,
    "nearestStormBearing":336,
    "precipIntensity":0,
    "precipProbability":0,
    "temperature":61.63,
    "apparentTemperature":61.63,
    "dewPoint":54.99,
    "humidity":0.79,
    "pressure":1013.68,
    "windSpeed":6.34,
    "windGust":9.16,
    "windBearing":249,
    "cloudCover":0.43,
    "uvIndex":0,
    "visibility":8.32,
    "ozone":294.6
    }
   */
}
