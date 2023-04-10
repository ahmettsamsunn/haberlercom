//
//  DetailViewController.swift
//  haberler
//
//  Created by Ahmet Samsun on 8.04.2023.
//

import UIKit
import AVKit
import AVFoundation

class DetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spotLabel: UILabel!
    var selectedNews: News?
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        if let news = selectedNews {
            navigationItem.title = news.category
            spotLabel.text = news.spot
            titleLabel.text = news.title
            spotLabel.sizeToFit()
            titleLabel.sizeToFit()

            if let imageUrl = URL(string: news.imageUrl) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }
            }
        }
    }
    @IBAction func button1(_ sender: Any) {
        if let videoURL = URL(string: selectedNews?.videoUrl ?? "") {
                 let player = AVPlayer(url: videoURL)
                 let playerViewController = AVPlayerViewController()
                 playerViewController.player = player
                 present(playerViewController, animated: true) {
                     player.play()
                 }
             }
    }
    
    }


        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


