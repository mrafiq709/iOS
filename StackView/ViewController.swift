//
//  ViewController.swift
//  StackView
//
//  Created by Md Rafiqul Islam on 8/1/19.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var imageName: UILabel!
    
    @IBOutlet weak var customImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: Actions
    @IBAction func setCustomImage(_ sender: UIButton) {
        imageName.text = "Custom Flower"
    }
    

}

