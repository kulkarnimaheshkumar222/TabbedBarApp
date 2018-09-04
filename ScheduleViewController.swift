//
//  ScheduleViewController.swift
//  TabbedBarApp
//
//  Created by Mac on 31/08/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let datePicker = UIDatePicker()

    let selectRoomArray = ["BEDROOM","LIVING ROOM","DINING ROOM","KITCHEN"]
    
    let selectApplianceArray = ["LIGHT1","LIGHT2","LIGHT3","FAN"]
    
    private var myTableView = UITableView()
    
    private var myTableView2 = UITableView()
      @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var myview: UIView!
    @IBOutlet weak var updateButton: UIButton!
    
    //Outlet of Textfield
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    
    //outlet of dropDown button
    @IBOutlet weak var dropDown1: UIButton!
    @IBOutlet weak var dropDown2: UIButton!
    
    
    @IBOutlet weak var texfield: UITextField!
    //DropDown button1 Action
    
    @IBAction func dropDownAction(_ sender: UIButton) {
        
        // let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        // let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 20, y: 220, width: displayWidth-42, height: 200))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.layer.borderWidth = 2
        myTableView.layer.borderColor = UIColor.blue.cgColor
        self.view.addSubview(myTableView)
       
        
    }
    
    //DropDown button 2 Action2
    
    
    @IBAction func dropDown2(_ sender: UIButton) {
        let displayWidth: CGFloat = self.view.frame.width
        // let displayHeight: CGFloat = self.view.frame.height
        
        myTableView2 = UITableView(frame: CGRect(x: 20, y: 310, width: displayWidth-42, height: 200))
        myTableView2.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView2.dataSource = self
        myTableView2.delegate = self
        myTableView2.layer.borderWidth = 2
        myTableView2.layer.borderColor = UIColor.blue.cgColor
        self.view.addSubview(myTableView2)
        
    }
    
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
       updateButton.layer.cornerRadius = 15
        updateButton.clipsToBounds = true
        
        myview.layer.cornerRadius = 15
        myview.clipsToBounds = true
        
        textfield1.layer.cornerRadius = 10
        textfield1.clipsToBounds = true
        
        textfield2.layer.cornerRadius = 10
        textfield2.clipsToBounds = true
        
        dropDown1.layer.cornerRadius = 10
        dropDown1.clipsToBounds = true
        
        dropDown2.layer.cornerRadius = 10
        dropDown2.clipsToBounds = true
        
        myTableView.layer.cornerRadius = 15
        myTableView.clipsToBounds = true
        
        
        //To make textfield border invisible
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.blue.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        // Do any additional setup after loading the view.
        
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.isUserInteractionEnabled = true
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneCompleted))
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(cancelCompleted))
        
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([doneButton,cancelButton,spaceButton], animated: true)
        
        datePicker.datePickerMode = .time
        texfield.inputAccessoryView = toolBar
        texfield.inputView = datePicker
        datePicker.backgroundColor = .white
        datePicker.setValue(UIColor.red, forKey:"textColor")
        

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableView == myTableView){
        return selectRoomArray.count
        }
        else{
        return selectApplianceArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == myTableView){
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = selectRoomArray[indexPath.row]
           return cell
        }
        else{
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = selectApplianceArray[indexPath.row]
        return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(tableView == myTableView){
        let cell = tableView.cellForRow(at: indexPath)
        textfield1.text=cell?.textLabel?.text
        myTableView.isHidden = true
        }
        else{
            let cell = tableView.cellForRow(at: indexPath)
            textfield2.text=cell?.textLabel?.text
            myTableView2.isHidden = true
        }
        
    }
    
    
    
    @IBAction func updateAction(_ sender: UIButton) {
        
        
        
        
        
    }
    @objc func doneCompleted(sender:UIDatePicker)
    {
        let formatter = DateFormatter()

        formatter.timeStyle = .short
        texfield.text = formatter.string(from: datePicker.date)
       // datePicker.removeFromSuperview()
        view.endEditing(true)
    }
    @objc func cancelCompleted(){
        view.endEditing(true)
    }
    
    @IBAction func daySelectionAction(_ sender: UIButton) {
        
        
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
