//
//  WebService.swift
//  VM
//
//  Created by Hima Chhatrala on 09/10/22.
//

import Foundation

class WebService {
    
    func getContacts(completion: @escaping ([Contact]?) -> ()) {
        let url = URL(string: "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/people")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let contacts = try? JSONDecoder().decode([Contact].self, from: data)
                
                if let contacts = contacts {
                    completion(contacts)
                }
            }
        }.resume()
    }
    
    func getRooms(completion: @escaping ([Room]?) -> ()) {
        let url = URL(string: "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/rooms")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let rooms = try? JSONDecoder().decode([Room].self, from: data)
                if let rooms = rooms {
                    completion(rooms)
                }
            }
        }.resume()
    }
}
