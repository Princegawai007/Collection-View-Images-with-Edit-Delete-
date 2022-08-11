//
//  ViewController.swift
//  CollectionViewWithXIB(editDelete)
//
//  Created by Prince's Mac on 08/07/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var myCollectionView: UICollectionView!
    var productImage = ["Burger","Creamymacroni","Frenchfries","Grilledsandwich","Hakkanoodles","Momos","Pasta","Burger","Creamymacroni","Frenchfries","Grilledsandwich","Hakkanoodles","Momos","Pasta","Burger","Creamymacroni","Frenchfries","Grilledsandwich","Hakkanoodles","Momos","Pasta","Burger","Creamymacroni","Frenchfries","Grilledsandwich","Hakkanoodles","Momos","Pasta","Burger","Creamymacroni","Frenchfries","Grilledsandwich","Hakkanoodles","Momos","Pasta"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        myCollectionView.allowsMultipleSelection = editing
        deleteButton.isEnabled = editing
        
        myCollectionView.indexPathsForVisibleItems.forEach{(indexPath) in
            let cell = myCollectionView.cellForItem(at: indexPath)as! MyCollectionViewCell
            cell.isEditing = editing
        }
    }
    @IBAction func deleteSelectedItem(_ sender: UIBarButtonItem) {
        if let selectedItems = myCollectionView.indexPathsForSelectedItems{
            let items = selectedItems.map{$0.item}.sorted().reversed()
            for item in items {
                productImage.remove(at: item)
            }
            myCollectionView.deleteItems(at: selectedItems)
        }
    }
}
    extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        cell.myImage.image = UIImage(named: productImage[indexPath.item])
        cell.isEditing = isEditing
        return cell
}
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let collectionWidth = collectionView.bounds.width
            return CGSize(width: collectionWidth/3, height:collectionWidth/3)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
}
