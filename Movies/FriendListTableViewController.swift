//
//  FriendListTableViewController.swift
//  Movies
//
//  Created by Mathias Quintero on 1/23/16.
//  Copyright © 2016 LS1 TUM. All rights reserved.
//

import UIKit

class FriendListTableViewController: UITableViewController {
    
    var friends = [Person]()
    
    var doNotInclude = [Person]()
    
    var user: User?
    
    var selectedFriend: Person?
    
    func updateFriends(_ friends: [Person]) {
        self.friends = friends.filter()  { (item) in
            return doNotInclude.filter() { (person) in
                return person.id == item.id
            }.isEmpty
        }
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        user?.getFriends(updateFriends)
        tableView.backgroundColor = Constants.tintColor
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friend") as? FriendTableViewCell ?? FriendTableViewCell()
        cell.person = friends[indexPath.row]
        cell.backgroundColor = Constants.tintColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        self.selectedFriend = friends[indexPath.row]
        return indexPath
    }

}
