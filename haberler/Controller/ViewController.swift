//
//  ViewController.swift
//  haberler
//
//  Created by Ahmet Samsun on 31.03.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    private var haberler : [News]?
    
   var Manager = Webservice()
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        Manager.fetchhaberler { [weak self] (haberler) in
                   self?.haberler = haberler
                   DispatchQueue.main.async {
                       self?.tableview.reloadData()
                       print(haberler[0].title)
                       print(haberler[0].webUrl)
                   }
               }
       
       
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return haberler?.count ?? 2
    }
 

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedNews = haberler?[indexPath.row] {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            vc.selectedNews = selectedNews
            self.performSegue(withIdentifier: "DetailViewController", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewController" {
            let vc = segue.destination as! DetailViewController
            vc.selectedNews = haberler?[tableview.indexPathForSelectedRow?.row ?? 0]
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "HaberlerCell", for: indexPath) as! TableViewCell
            
            // Hücreyi özelleştir
            if let haber = haberler?[indexPath.row] {
                cell.label1.text = haber.title
                
                
            }
            
            return cell
    }
}


