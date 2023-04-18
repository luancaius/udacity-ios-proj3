//
//  MemeViewController.swift
//  memev2
//
//  Created by Luan Ramos on 2023-04-18.
//
import Foundation
import UIKit

class MemeViewController : UIViewController {
    
    var meme: Meme!
        
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView!.image = meme.memedImage
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
}
