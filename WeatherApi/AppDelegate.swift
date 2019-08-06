//
//  AppDelegate.swift
//  WeatherApi
//
//  Created by Md Rafiqul Islam on 8/5/19.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // <#For Testing, is NetworkProcessor class is working or not#>
        // <#If working then it will print the data in bytes in console#>
        /*
        let url = URL(string: "https://api.darksky.net/forecast/a4c79ac1342d72accd5f4f4547f97869/37.8267,-122.4233")!
        
        let networkProcessor = NetworkProcessor(url: url)
        
        networkProcessor.downloadJSONFromUrl{ (jsonDictionary) in
            print(jsonDictionary)
        }
        */
        
        // <#initialized forcast service URL with APIKey#>
        let forcastService = ForecastService(APIKey: "a4c79ac1342d72accd5f4f4547f97869")
        
        // <#Get the weather data#>
        forcastService.getForecast(latitude: 37.8267, longitude: -122.4233){ (currentWeather) in
            print(currentWeather)
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

