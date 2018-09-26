//
//  TableViewController.swift
//  PassDataDelegate-TableView
//
//  Created by trung on 2018/08/18.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, DelegateDetail {
    
    func passDelegate(passData: String) {
        if let index = tableView.indexPathForSelectedRow {
            arraySring[index.row] = passData
        }
        else {
            arraySring.append(passData)
        }
        hasNoData = arraySring.count == 0
        tableView.reloadData()
    }
    
    
    @IBOutlet var noDataView: UIView!
    @IBOutlet weak var foodterView: UIView!
    
    var hasNoData: Bool = true {
        didSet {
            hasNoData ? (tableView.tableFooterView = noDataView) : (tableView.tableFooterView = foodterView)
        }
    }
    
    var arraySring = [String]()
//    var arraySring = ["a","b","c"]

    override func viewDidLoad() {
        super.viewDidLoad()
        hasNoData = arraySring.count == 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraySring.count
    }

   
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arraySring[indexPath.row]
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toDetail = segue.destination as? DetailViewController  {
            toDetail.delegate = self
            if let index = tableView.indexPathForSelectedRow {
                toDetail.data = arraySring[index.row]
            }
        
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arraySring.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            hasNoData = arraySring.count == 0
        }
        tableView.reloadData()
    }

}
