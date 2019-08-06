import Foundation
// <#Service class for Weather Forecast#>
class ForecastService
{
    // <#API KEY#>
    let forecastAPIKey: String
    
    // <#BASE URL#>
    let forecastBaseUrl: URL?
    
    /// <#Initializer#>
    ///
    /// - Parameter APIKey: <#APIKey#>
    init(APIKey: String) {
        self.forecastAPIKey = APIKey
        forecastBaseUrl = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    /// <#Get Forecast Weather Data#>
    ///
    /// - Parameters:
    ///   - latitude: <#latitude description#>
    ///   - longitude: <#longitude description#>
    ///   - completion: <#For network call it would takes some time, for that we need to exit or escape from this method#>
    ///                 <#after completion. That's why @escaping annotation#>
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void)
    {
        if let forecastUrl = URL(string: "\(forecastBaseUrl!)/\(latitude),\(longitude)")
        {
            // <#Network Caller/API caller instance#>
            let networkProcessor = NetworkProcessor.init(url: forecastUrl)
            
            networkProcessor.downloadJSONFromUrl({ (jsonDictionary) in
                
                // <#Parse jsonDictionary into a Swift Weather Object#>
                if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: Any]{
                    
                    // <#initialize CurrentWeather model with JSON Data#>
                    let currentWeater = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    
                    // <#Passing The JSON Data by completion#>
                    completion(currentWeater)
                    
                }else{
                    completion(nil)
                }
            })
            
        }
    }
    
    
}
