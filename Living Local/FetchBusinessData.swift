//
//  FetchBusinessData.swift
//  Living Local
//
//  Created by Fay Lin  on 8/6/21.
//

import Foundation

extension SearchViewController {
    func retrievePlaces(latitude: Double,
                        longitude: Double,
                        category: String,
                        limit: Int,
                        sortBy: String,
                        locale: String,
                        completionHandler: @escaping ([Place]?, Error?) -> Void) {
        let apiKey = "bJkuehvr0RfJd32xHs80ZxdWcSvGlLviPuFCwxhlVT6wRm7m3QpKS15Ncy9bJ6Sxe1nyiAiBJOFl7B91m8OoB4xwZFfAiFmG3nLVwjymBn5hxmX86kke02-44XwLYXYx"
        let baseURL = "https://api.yelp.com/v3/businesses/search?latitude=\(latitude)&longitude\(longitude)&categories=\(category)&limit=\(limit)&sort_by=\(sortBy)&locale\(locale)"
        let url = URL(string: baseURL)
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {
            (data,response, error) in
            if let error = error {
                
                completionHandler(nil, error)
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                guard let resp = json as? NSDictionary else { return }
                
                guard let businesses = resp.value(forKey: "businesses") as? [NSDictionary] else { return }
                var placesList: [Place] = []
                
                for business in businesses{
                var place = Place()
                    place.name = business.value(forKey: "name") as? String
                    place.id = business.value(forKey:"id") as? String
                    place.price = business.value(forKey: "price") as? String
                    place.is_closed = business.value(forKey: "is-closed") as? Bool
                    place.distance = business.value(forKey: "distance") as? Double
                    let address = business.value(forKeyPath: "location.display_address") as? [String]
                    place.address = address?.joined(separator: "\n")
                    
                    placesList.append(place)
                }
                
                
                completionHandler(placesList, nil)
            } catch {
                print("Caught error")
            }
        }.resume()
        }
        
        
        
    }

