//
//  ViewController.swift
//  TableViewMultipleCellTypes
//
//  Created by Md Rafiqul Islam on 8/8/19.
//  Copyright © 2019 Example. All rights reserved.
//

import UIKit

class CustomCountryCell: UITableViewCell {
    @IBOutlet weak var countryIcon: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    
}

class CustomPopulationCell: UITableViewCell {
    @IBOutlet weak var countryPopulation: UILabel!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableData = ["Australia", 24.13, "Canada", 36.29, "China", 1379, "India", 1324, "UnitedStatesofAmerica", 323.1] as [Any]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        tableView.rowHeight = 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let string = self.tableData[indexPath.row] as? String
        {
            let cell:CustomCountryCell = self.tableView.dequeueReusableCell(withIdentifier: "customCountryCell") as! CustomCountryCell
            
            cell.countryName?.text = string
            cell.countryIcon?.image = UIImage(named:string)
            return cell
        }
            
        else if let population = self.tableData[indexPath.row] as? Any, population is Double || population is Int {
            
            let cell:CustomPopulationCell = self.tableView.dequeueReusableCell(withIdentifier: "customPopulationCell") as! CustomPopulationCell
            
            cell.countryPopulation?.text = "Population is \(population) million"
            
            return cell
            
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

