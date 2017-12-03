//
//  DetailViewController.swift
//  Brand
//
//  Created by FatahKhair on 12/3/17.
//  Copyright © 2017 Rio Ihsan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var tahun: UILabel!
    @IBOutlet weak var pencetus: UILabel!
    
    var passID:String?
    var passNama:String?
    var passTahun:String?
    var passPencetus:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        id.text = passID!
        nama.text = passNama!
        tahun.text = passTahun!
        pencetus.text = passPencetus!

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
