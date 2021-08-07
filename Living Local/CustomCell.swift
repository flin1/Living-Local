//
//  CustomCell.swift
//  Living Local
//
//  Created by Fay Lin  on 8/6/21.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var isClosedLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    var isClosed: Bool = false {
        didSet{
            if isClosed {
                isClosedLabel.text = "Closed"
                isClosedLabel.textColor = UIColor(red: 148/255, green: 33/255, blue: 147/255, alpha: 1)
            }else{
                isClosedLabel.text = "Open Now"
                isClosedLabel.textColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        parentView.layer.cornerRadius = 15
        
    }

}
