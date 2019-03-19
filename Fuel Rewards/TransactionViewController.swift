//
//  TransactionViewController.swift
//  Fuel Rewards
//
//  Created by MyMac on 3/19/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var transactionsList: [Transaction] = []
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else {return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                let transactions = try JSONDecoder().decode([Transaction].self, from: data)
                self.transactionsList = transactions
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch let jsonError{
                print("Error serializing json:", jsonError)
            }
            
            
            }.resume()
        
        
    }
    
    // MARK: - UITableView Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.transactionsList[indexPath.row].name
        cell.textLabel?.text = self.transactionsList[indexPath.row].username
        cell.textLabel?.text = self.transactionsList[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: When the user a select a specific trasanction to show the view of that transaction
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        super.viewWillAppear(animated)
    }
    

}

