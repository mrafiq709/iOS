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

// <# We’ve implemented the two protocols present in the UITableView class i.e. UITableViewDelegate and UITableViewDataSource #>
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // <# tableData is a generic array that holds String, Double and Integer types. The string element is used to set the Image(the image assets have the same name set in the Assets folder) and country name. #>
    var tableData = ["Australia", 24.13, "Canada", 36.29, "China", 1379, "India", 1324, "UnitedStatesofAmerica", 323.1] as [Any]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        // <# sets the row height for each UITableViewCell. #>
        tableView.rowHeight = 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //<# Cell of the type CustomCountryCell is added in the UITableView if the current element in the tableData is a String. #>
        if let string = self.tableData[indexPath.row] as? String
        {
            let cell:CustomCountryCell = self.tableView.dequeueReusableCell(withIdentifier: "customCountryCell") as! CustomCountryCell
            
            cell.countryName?.text = string
            cell.countryIcon?.image = UIImage(named:string)
            return cell
        }
            //<# To check whether the current element in the tableData is of the type Double or Integer #>
            // <# In the below code snippet, the , acts as a where clause. The condition reads as : “if self.tableData[indexPath.row] is a valid element, typecast it to Any and check whether it is of the type Double OR type Int”. #>
        else if let population = self.tableData[indexPath.row] as? Any, population is Double || population is Int {
            
            let cell:CustomPopulationCell = self.tableView.dequeueReusableCell(withIdentifier: "customPopulationCell") as! CustomPopulationCell
            
            cell.countryPopulation?.text = "Population is \(population) million"
            
            return cell
            
        }
        
        // <# return UITableViewCell() is used to add a default empty cell if none of the conditions match #>
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
        
    }
    
    // <# didSelectRowAt function is used to add the click animation on each TableView row. #>
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

