//
//  RegistrationTableViewController.swift
//  HotelManzana
//
//  Created by wickedRun on 2021/08/22.
//

import UIKit

class RegistrationTableViewController: UITableViewController {

    var registrations: [Registration] = []
    var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return registrations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        let registration = registrations[indexPath.row]
        cell.textLabel?.text = registration.firstName + " " + registration.lastName
        cell.detailTextLabel?.text = dateFormatter.string(from: registration.checkInDate) + " - " + dateFormatter.string(from: registration.checkOutDate) + ": " + registration.roomType.name

        return cell
    }
    
    @IBSegueAction func addEditRegistration(_ coder: NSCoder, sender: Any?) -> AddRegistrationTableViewController? {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            let addRegistrationTableViewController = AddRegistrationTableViewController(coder: coder, registration: registrations[indexPath.row], roomType: registrations[indexPath.row].roomType)
            return addRegistrationTableViewController
        } else {
            return AddRegistrationTableViewController(coder: coder, registration: nil, roomType: nil)
        }
        // ?????? ???????????? ?????? ???????????? ??????????????? ?????? ?????????????????? ????????????????????? ?????? ??????????????? ??????????????? ???????????????
        // ????????? ?????? ????????? ????????????????????????????????? addRegistration??????????????? ?????? ??????????????? ??????????????? ????????????.
    }

    
    @IBAction func unwindFromAddRegistration(unwindSegue: UIStoryboardSegue) {
        guard let addRegistrationTableViewController = unwindSegue.source as? AddRegistrationTableViewController,
              let registration = addRegistrationTableViewController.registration else { return }
        let registIds = registrations.map { $0.firstName + " " + $0.lastName }
        let id = "\(registration.firstName) \(registration.lastName)"
        if !registIds.contains(id) {
            registrations.append(registration)
        } else {
            if let index = registIds.firstIndex(of: id) {
                registrations[index] = registration
            }
        }
        tableView.reloadData()
    }

}
