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
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let space:CGFloat = 3.0
        let widthDimension = (view.frame.size.width - (2 * space)) / 3.0

        collectionViewFlowLayout.minimumInteritemSpacing = space
        collectionViewFlowLayout.minimumLineSpacing = space
        collectionViewFlowLayout.itemSize = CGSize(width: widthDimension, height: widthDimension)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        allMemes = appDelegate.memes
        print("total memes:\(allMemes.count)")
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: Collection View Data Source

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allMemes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let Meme = self.allMemes[(indexPath as NSIndexPath).row]
        cell.MemeImageView?.image = Meme.memedImage
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
        detailController.meme = self.allMemes[(indexPath as NSIndexPath).row]
        present(detailController, animated: true, completion: nil)
    }
}
