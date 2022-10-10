//
//  DetailsViewController.swift
//  VM
//
//  Created by Hima Chhatrala on 10/10/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var contactVM : ContactViewModel?
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var favColor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatar.imageFromServerURL(urlString: contactVM!.avatar, PlaceHolderImage: UIImage(named: "VirginMoney")!)
        avatar.layer.cornerRadius = avatar.frame.height / 2
        name.text = contactVM?.fullName
        jobTitle.text = contactVM?.jobtitle
        email.text = "E-mail : " + contactVM!.email
        favColor.text = "Fav Color : " + contactVM!.favouriteColor
    }
    
}
