//
//  MyCollectionViewCell.swift
//  CollectionViewWithXIB(editDelete)
//
//  Created by Prince's Mac on 08/07/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.myLable.layer.cornerRadius = 4
        self.myLable.layer.masksToBounds = true
        self.myLable.layer.borderColor = UIColor.black.cgColor
        self.myLable.layer.borderWidth = 1.0
        self.myLable.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
    }
    var isEditing : Bool = false{
        didSet{
            myLable.isHidden = !isEditing
        }
    }
    override var isSelected: Bool{
        didSet{
            if isEditing{
                myLable.text = isSelected ? "✓" : ""
            }
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        myLable.isHidden = !isEditing
    }
}
