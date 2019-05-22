//
//  ViewController.swift
//  GIFImageLoader
//
//  Created by Ajithram on 21/05/19.
//  Copyright © 2019 Ajithram. All rights reserved.
//

import UIKit
import FLAnimatedImage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: FLAnimatedImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImageFromLocalData(imageName: "coinAnimation")
//        loadImageFromUrl(gifImageUrl: "https://upload.wikimedia.org/wikipedia/commons/2/2c/Rotating_earth_%28large%29.gif")
    }
    
    func loadImageFromLocalData(imageName: String){
        let path1 : String = Bundle.main.path(forResource: imageName, ofType: "gif")!
        let url = URL(fileURLWithPath: path1)
        do {
            let gifData = try Data(contentsOf: url)
            let imageData1 = FLAnimatedImage(animatedGIFData: gifData)
            imageView.animatedImage = imageData1
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadImageFromUrl(gifImageUrl: String){
        let urlString = gifImageUrl
        let url = URL(string: urlString)!
        let imageData = try? Data(contentsOf: url)
        let imageData3 = FLAnimatedImage(animatedGIFData: imageData)
        imageView.animatedImage = imageData3
    }


}

