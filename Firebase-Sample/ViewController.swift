//
//  ViewController.swift
//  Firebase-Sample
//
//  Created by Александр Полочанин on 3.06.23.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet var imageView: UIImageView!
    
    
    @IBOutlet var labelOne: UILabel!
    
    @IBOutlet var labelTwo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionOne(_ sender: UIButton) {
        NetworkManager.shared.getPost(collection: "cars", documentName: "smallCar") { document in
            guard document != nil else { return }
            self.labelOne.text = document?.fieldOne
            self.labelTwo.text = document?.fieldTwo
        }
        
        NetworkManager.shared.getImage(pictureName: "c-class") { dataImage in
            self.imageView.image = dataImage
        }
    }
    
    @IBAction func actionTwo(_ sender: Any) {
        
    }
    
    
    @IBAction func actionThree(_ sender: Any) {
        
    }
    
}

