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
     print("Error with the response, unexpected status code: \(response)")
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
     
     
     
     /*  func verileriçek(urlString : String) {
      if let url = URL(string: urlString  ){
      let session = URLSession(configuration: .default)
      let task  = session.dataTask(with: url) { data, response, error in
      if error != nil {
      print(error?.localizedDescription ?? "hata")
      }else if error == nil {
      let decoder = JSONDecoder()
      if let safeData = data {
      do{
      let resultss = try decoder.decode(Haberler.self, from: safeData)
      
      print("başarılı")
      DispatchQueue.main.sync {
      self.HABER = resultss.news
      }
      
      
      print(self.HABER[0].title)
      
      
      }catch{
      print(error.localizedDescription)
      }
      }
      }
      }
      task.resume()
      }
      
      }*/
     
     }

