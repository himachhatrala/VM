//
//  ContactViewModel.swift
//  VM
//
//  Created by Hima Chhatrala on 09/10/22.
//

import Foundation

class ContactListViewModel {
    var contacts = Bindable<[Contact]>()
    var isSearching = Bindable<Bool>()
}

extension ContactListViewModel {
    
    func performSearch(_ searchText: String) {
        print("search String : \(searchText)")
        //debounce
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            WebService().getContacts { [weak self] contacts in
            if let contacts = contacts {
                if searchText != ""{
                    var filteredData = [Contact]()
                    for contact in contacts {
                        if contact.firstName.uppercased().contains(searchText.uppercased()) ||
                            contact.lastName.uppercased().contains(searchText.uppercased()) {
                            filteredData.append(contact)
                        }
                    }
                    self?.contacts.value = filteredData
                } else {
                    self?.contacts.value = contacts
                }
            }
        }})
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.contacts.value?.count ?? 0
    }
    
    func contactAtIndex(_ index:Int) -> ContactViewModel {
        let contact = self.contacts.value?[index] ?? nil
        return ContactViewModel(contact!)
    }
}



struct ContactViewModel {
    private let contact: Contact
}

extension ContactViewModel {
    init(_ contact: Contact) {
        self.contact = contact
    }
}

extension ContactViewModel {
    var createdAt: String {
        return self.contact.createdAt
    }
    
    var firstName: String {
        return self.contact.firstName
    }
    
    var avatar: String {
        return self.contact.avatar
    }
    
    var lastName: String {
        return self.contact.lastName
    }
    
    var fullName: String {
        return self.contact.firstName + " " + self.contact.lastName
    }
    
    var email: String {
        return self.contact.email
    }
    
    var jobtitle: String {
        return self.contact.jobtitle
    }
    
    var favouriteColor: String {
        return self.contact.favouriteColor
    }
    
    var id: String {
        return self.contact.id
    }
}
