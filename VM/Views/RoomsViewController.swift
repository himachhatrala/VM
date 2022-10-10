//
//  RoomsViewController.swift
//  VM
//
//  Created by Hima Chhatrala on 09/10/22.
//

import UIKit

class RoomsViewController: UIViewController {

    private var roomListVM = RoomListViewModel()
    
    @IBOutlet weak var roomsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roomsTableView.delegate = self
        roomsTableView.dataSource = self
        
        setupRoomListVMObserver()
        self.roomListVM.loadRooms()
    }
    
    fileprivate func setupRoomListVMObserver() {
        roomListVM.rooms.bind { [weak self] (_) in
            DispatchQueue.main.async {
                self?.roomsTableView.reloadData()
            }
        }
    }
}

extension RoomsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.roomListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.roomListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath) as? RoomsTableViewCell else {
            fatalError("RoomTableViewCell not found")
        }
        
        let roomVM = self.roomListVM.contactAtIndex(indexPath.row)
        cell.roomID.text = roomVM.id
        cell.maxOccupancy.text = "Max Occupancy : " + String(roomVM.maxOccupancy)
        cell.isOccupied.text = roomVM.isOccupied ? "Occupied" : "Available"
        cell.isOccupied.textColor = roomVM.isOccupied ? .systemRed : .systemGreen
        return cell
    }
}
