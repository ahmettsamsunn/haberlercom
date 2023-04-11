//
//  servis.swift
//  haberler
//
//  Created by Ahmet Samsun on 31.03.2023.
//


import Foundation
class Webservice  {
  
    
    var HABER = [News]()
     func fetchhaberler(completionHandler: @escaping ([News]) -> Void) {
     let url = URL(string: "http://app.haberler.com/services/haberlercom/2.11/service.asmx/haberler?category=manset&count=35&offset=0&deviceType=1&userId=61ed99e0c09a8664")!
     
     let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
     if let error = error {
     print("Error : \(error)")
     return
     }
     
     guard let httpResponse = response as? HTTPURLResponse,
     (200...299).contains(httpResponse.statusCode) else {
     print("Error : \(response)")
     return
     }
     
     if let data = data,
     let haberler = try? JSONDecoder().decode(Haberler.self, from: data) {
         for var haber in haberler.news ?? [] {
             haber.webUrl = "http://www.haberler.com/\(haber.title.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)/"
         }
         completionHandler(haberler.news ?? [])
     }
     })
     task.resume()
     }
     
     
     
     
     
     }

