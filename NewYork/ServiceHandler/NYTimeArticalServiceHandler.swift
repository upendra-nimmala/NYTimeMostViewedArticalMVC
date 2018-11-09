//
//  NYTimeArticalServiceHandler.swift
//  NewYork
//
//  Created by Upendra Nimmala on 08/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum MostViewiedArticalDays: String {
    
    case oneDay = "1"
    case week = "7"
    case month = "30"
}

struct APPURL {

    private struct Domains {
        static let baseUrl = "http://api.nytimes.com"
    }
    
    private  struct Routes {
        static let route = "/svc/mostpopular/v2/mostviewed/all-sections/"
    }
    private struct ApiKey {
        static let apiKey = "328c8770deff4e44b77b935618667461"
    }
    
    private  static let Domain = Domains.baseUrl
    private  static let Route = Routes.route
    private  static let BaseURL = Domain + Route + MostViewiedArticalDays.week.rawValue
    

    
    static var getMostViewdArticals : String {
        return BaseURL  + ".json?api-key=\(ApiKey.apiKey)"
    }
    
}

class NYTimeArticalServiceHandler: NSObject {
    
    public static let shared: NYTimeArticalServiceHandler = NYTimeArticalServiceHandler()
    
    func getNYTimeMostViewedArticals(successHandler: @escaping ((Results) -> Void), errorHandler: @escaping ((NSError) -> Void)) {
        
        if let url = URL(string: APPURL.getMostViewdArticals) {
            var request = URLRequest(url: url)
            request.httpMethod = RequestMethod.get.rawValue
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in
                
                if let data = data {
                    do {
                        let articals = try JSONDecoder().decode(Results.self, from: data)
                        successHandler(articals)
                    } catch {
                        print(error.localizedDescription)
                        errorHandler(error as NSError)
                    }
                } else {
                    errorHandler(error as NSError? ?? NSError())
                }
            }
            task.resume()
        }
        
    }
    
}
