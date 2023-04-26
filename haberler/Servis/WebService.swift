//
//  servis.swift
//  haberler
//
//  Created by Ahmet Samsun on 31.03.2023.
//


import Foundation
class Webservice  {
  
    
    var HABER = [News]()
    func fetchhaberler(completion: @escaping ([News]) -> Void) {
        let urlString = "http://app.haberler.com/services/haberlercom/2.11/service.asmx/haberler?category=manset&count=35&offset=0&deviceType=1&userId=61ed99e0c09a8664"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                if let haberler = try? decoder.decode(Haberler.self, from: data) {
                    DispatchQueue.main.async {
                        completion(haberler.news ?? [])
                    }
                } else {
                    print("Error decoding JSON")
                }
            } else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
        task.resume()
    }

     
     
     
     
     }

