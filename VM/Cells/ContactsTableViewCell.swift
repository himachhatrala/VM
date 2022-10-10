//
//  ContactsTableViewCell.swift
//  VM
//
//  Created by Hima Chhatrala on 09/10/22.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
