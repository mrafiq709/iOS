//
//  WeatherViewController.swift
//  WeatherApi
//
//  Created by Md Rafiqul Islam on 8/6/19.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // <#MARK: Properties#>
    @IBOutlet weak var temperatureTextLabel: UILabel!
    
    let forecastAPIKey = "a4c79ac1342d72accd5f4f4547f97869"
    let coordinate: (lat: Double, long: Double) = (37.8267, -122.4233)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.lat, longitude: coordinate.long){
            (currentWeather) in
            
            // <#OFF The Main Queue#>
            if let currentWeather = currentWeather{
                
                // <#All UI Code Must Happen on The Main Queue#>
                // <#Get Back on The Main Queue#>
                DispatchQueue.main.async {
                    if let temperature = currentWeather.temparature{
                        self.temperatureTextLabel.text = "\(temperature)"
                    }else{
                        self.temperatureTextLabel.text = "-"
                    }
                }
            }
        }
    }

}
