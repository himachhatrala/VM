//
//  RoomsTableViewCell.swift
//  VM
//
//  Created by Hima Chhatrala on 10/10/22.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var roomView: UIView!
    @IBOutlet weak var roomID: UILabel!
    @IBOutlet weak var maxOccupancy: UILabel!
    @IBOutlet weak var isOccupied: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
