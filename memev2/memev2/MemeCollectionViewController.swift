//
//  MemeCollectionView.swift
//  memev2
//
//  Created by Luan Ramos on 2023-01-21.
//

import Foundation
import UIKit

// MARK: - MemeCollectionViewController: UICollectionViewController

class MemeCollectionViewController: UICollectionViewController {

    // MARK: Properties

    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    // TODO: Add outlet to flowLayout here.

    var allMemes = [Meme]()

    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        allMemes = appDelegate.memes
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let flowLayout = collectionViewFlowLayout as! UICollectionViewFlowLayout
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        let width = (collectionView.frame.width - (2 * flowLayout.minimumInteritemSpacing)) / 3
        flowLayout.itemSize = CGSize(width: width, height: width)
        collectionView.register(MemeCollectionViewCell.self, forCellWithReuseIdentifier: "MemeCollectionViewCell")

    }

    override func viewDidAppear(_ animated: Bool) {
        print("inside viewDidAppear")

        super.viewWillAppear(animated)
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        allMemes = appDelegate.memes
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    // MARK: Collection View Data Source

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allMemes.count
        //return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("inside collection view - total memes: \(self.allMemes.count)")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let Meme = self.allMemes[(indexPath as NSIndexPath).row]
        cell.MemeImageView?.image = Meme.memedImage
        //let placeholderImage = UIImage(systemName: "photo")
        //cell.MemeImageView?.image = placeholderImage

        
        return cell
    }
}
