//
//  ContactsViewController.swift
//  VM
//
//  Created by Hima Chhatrala on 09/10/22.
//

import UIKit


class ContactsViewController: UIViewController {

    private var contactListVM = ContactListViewModel()
    
    var filteredData = [Contact]()
    
    var selectedRow = Int()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactsTableView.separatorStyle = .none
        contactsTableView.keyboardDismissMode = .onDrag
        
        searchBar.delegate = self
        
        setupContactListVMObserver()
        
        setup()
        
    }
    
    fileprivate func setupContactListVMObserver() {
        contactListVM.contacts.bind { [weak self] (_) in
            DispatchQueue.main.async {
                self?.contactsTableView.reloadData()
            }
        }
    }
    
    private func setup() {
        self.contactListVM.performSearch("")
    }
    
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.contactListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contactVM = self.contactListVM.contactAtIndex(selectedRow)
        if segue.identifier == "goToDetails" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.contactVM = contactVM
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as? ContactsTableViewCell else {
            fatalError("ContactTableViewCell not found")
        }
        
        let contactVM = self.contactListVM.contactAtIndex(indexPath.row)
        cell.contactNameLabel.text = contactVM.fullName
        cell.contactImageView.clipsToBounds = true
        cell.contactImageView?.imageFromServerURL(urlString: contactVM.avatar, PlaceHolderImage: UIImage(named: "VirginMoney")!)
        cell.contactImageView.layer.cornerRadius = cell.contactImageView.frame.height / 2
        return cell
    }
    
}

extension ContactsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.contactListVM.performSearch(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar?.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar?.endEditing(true)
    }
}

extension UIImageView {
    
    public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {
        if self.image == nil{
            self.image = PlaceHolderImage
        }
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
    
}
