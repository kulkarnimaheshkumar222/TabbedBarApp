//
//  SchedulescreenViewController.swift
//  TabbedBarApp
//
//  Created by Mac on 01/09/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class SchedulescreenViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var scheduleNameArray2=NSArray()
    var selectRoomArray2=NSArray()
    var selectApplianceArray2=NSArray()
    var selectTimeArray2=NSArray()
    var selectDayArray2=NSArray()
    
    
    @IBOutlet weak var scheduleButton: UIButton!
    @IBAction func scheduleAction(_ sender: UIButton) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ScheduleViewController") as! ScheduleViewController
        self.navigationController?.pushViewController(next, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleButton.layer.cornerRadius = 15
        scheduleButton.clipsToBounds = true
        self.dataForTable()

        
        // Do any additional setup after loading the view.
    }
    
    func dataForTable() {
        let result = DBWrapper.sharedObject.getAllTask(query: "select * from scheduleTable")
        scheduleNameArray2 = result.scheduleName as NSArray
        selectRoomArray2 = result.selectedRoom as NSArray
        selectApplianceArray2 = result.selectedAppliances as NSArray
        selectTimeArray2 = result.selectedTime as NSArray
        selectDayArray2 = result.selectedDay as NSArray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.dataForTable()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleNameArray2.count


    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        cell.scheduleNameLabel.text = scheduleNameArray2[indexPath.row] as? String
        cell.selectedRoomLabel.text = selectRoomArray2[indexPath.row] as? String
        cell.selectedAppliancesLabel.text = selectApplianceArray2[indexPath.row] as?
        String
        cell.selectedTimeLabel.text = selectTimeArray2[indexPath.row] as? String
        
        return cell
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
