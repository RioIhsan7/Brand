//
//  BrandTableViewController.swift
//  Brand
//
//  Created by FatahKhair on 12/3/17.
//  Copyright © 2017 Rio Ihsan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class BrandTableViewController: UITableViewController {
    var idSelected:String?
    var namaSelected:String?
    var tahunSelected:String?
    var pencetusSelected:String?
    
    var brand = [Brand]()
    var arr = [[String: AnyObject]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://localhost/BrandServer/index.php/Api/getBrand").responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.arr = resData as! [[String:AnyObject]]
                }
                if self.arr.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "brand", for: indexPath) as! BrandTableViewCell

        // Configure the cell...
        var dict = arr[indexPath.row]
        cell.nama.text = dict["nama_brand"] as? String
        cell.pencetus.text = dict["pencetus"] as? String

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("Row \(indexPath.row)selected")
        
        let task = arr[indexPath.row]
        idSelected = task["id_brand"] as? String
        namaSelected = task["nama_brand"] as? String
        tahunSelected = task["tahun_berdiri"] as? String
        pencetusSelected = task["pencetus"] as? String
        
        performSegue(withIdentifier: "passBrand", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passBrand"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailViewController
                let value = arr[indexPath.row]
                controller.passID = value["id_brand"] as? String
                controller.passNama = value["nama_brand"] as? String
                controller.passTahun = value["tahun_berdiri"] as? String
                controller.passPencetus = value["pencetus"] as? String
            }
        }
    }
}




