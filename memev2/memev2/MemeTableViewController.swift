//
//  MemeTableViewController.swift
//  memev2
//
//  Created by Luan Ramos on 2023-01-22.
//

import Foundation
import UIKit

class MemeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var allMemes =  [Meme]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        allMemes = appDelegate.memes
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allMemes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Starting tableView")
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        allMemes = appDelegate.memes
        print("tableView table total \(allMemes.count)")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeCell")!
        let meme = self.allMemes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.text = "\(meme.topText)...\(meme.bottomText)"
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
        detailController.meme = self.allMemes[(indexPath as NSIndexPath).row]
        present(detailController, animated: true, completion: nil)
    }
}
