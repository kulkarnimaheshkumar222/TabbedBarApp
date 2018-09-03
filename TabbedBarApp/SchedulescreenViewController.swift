//
//  SchedulescreenViewController.swift
//  TabbedBarApp
//
//  Created by Mac on 01/09/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class SchedulescreenViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var scheduleButton: UIButton!
    @IBAction func scheduleAction(_ sender: UIButton) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScheduleViewController") as! ScheduleViewController
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleButton.layer.cornerRadius = 15
        scheduleButton.clipsToBounds = true
        
        label1.layer.cornerRadius = 15
        label1.clipsToBounds = true
        
        
        label2.layer.cornerRadius = 15
        label2.clipsToBounds = true
        
        
        label3.layer.cornerRadius = 15
        label3.clipsToBounds = true
        
        
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
