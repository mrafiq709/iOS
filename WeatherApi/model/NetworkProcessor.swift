
import Foundation
// <#API Caller or Network Call or Server-Client Connection class#>
class NetworkProcessor
{
    // <#lazy -> If it is never used than it will not be initialized, After First used it will be initialized#>
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    
    let url: URL
    
    /// <#initializer#>
    /// - Parameter url: <#url description#>
    init(url: URL)
    {
        self.url = url
    }
    
    // <#Assign method parameter in new variable.#>
    typealias JSONDictionaryHandler = (([String: Any]?) -> Void)
    
    /// <#Donload JSON Data From URL#>
    ///
    /// - Parameter completion: <#For network call it would takes some time, for that we need to exit or escape from this method#>
    ///                         <#after completion. That's why @escaping annotation#>
    func downloadJSONFromUrl(_ completion: @escaping JSONDictionaryHandler)
    {
        let request = URLRequest(url: self.url)
        let dataTask = session.dataTask(with: request) {(data, response, error) in
            
            if error == nil
            {
                if let httpResponse = response as? HTTPURLResponse {
                    
                    // <#If Status Code == 200, Then Response is Succesfull#>
                    switch httpResponse.statusCode{
                    case 200:
                        if let data = data{
                            do{
                                // <#Get the JSON Data#>
                                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                
                                // <#Passing The JSON Data by completion#>
                                completion(jsonDictionary as? [String: Any])
                                
                            }catch let error as NSError{
                                print("Error JSON Retriving \(error.localizedDescription)")
                            }
                            
                        }
                    default:
                        print("HTTP Status Code: \(httpResponse.statusCode)")
                    }
                }
                
            }else
            {
                print("Error \(error?.localizedDescription)")
            }
        }
        // <#This is required#>
        dataTask.resume()
    }
}
