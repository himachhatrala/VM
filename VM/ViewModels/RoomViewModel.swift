//
//  RoomViewModel.swift
//  VM
//
//  Created by Hima Chhatrala on 10/10/22.
//

import Foundation

class RoomListViewModel {
    var rooms = Bindable<[Room]>()
}

extension RoomListViewModel {
    
    func loadRooms() {
        WebService().getRooms { [weak self] rooms in
            if let rooms = rooms {
                self?.rooms.value = rooms
            }
        }
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.rooms.value?.count ?? 0
    }
    
    func contactAtIndex(_ index:Int) -> RoomViewModel {
        let room = self.rooms.value?[index] ?? nil
        return RoomViewModel(room!)
    }
}



struct RoomViewModel {
    private let room: Room
}

extension RoomViewModel {
    init(_ room: Room) {
        self.room = room
    }
}

extension RoomViewModel {
    var createdAt: String {
        return self.room.createdAt
    }
    
    var isOccupied: Bool {
        return self.room.isOccupied
    }
    
    var maxOccupancy: Int {
        return self.room.maxOccupancy
    }
    
    var id: String {
        return self.room.id
    }
}
