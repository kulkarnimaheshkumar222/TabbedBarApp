//
//  DBWrapper.swift
//  TabbedBarApp
//
//  Created by Mac on 05/09/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit
import SQLite3
class DBWrapper: NSObject {
    
    
    
    var scheduleNameArray = NSMutableArray()
    
    var selectRoomArray = NSMutableArray()
    
    var selectApplianceArray = NSMutableArray()
    
    var selectTimeArray = NSMutableArray()
    
    var selectDayArray = NSMutableArray()
    static let sharedObject = DBWrapper()
    var db:OpaquePointer? = nil
    var stmt:OpaquePointer? = nil
    func getDatabasePath()->String{
        let dir:[String] = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var path:String = dir.first!
        path.append("/scheduleDataBase.db")
        return path
    }
    func executeQuery(query:String)-> Bool{
        var success:Bool = false
        let dbPath:String = getDatabasePath()
        if (sqlite3_open(dbPath,&db)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK){
                if(sqlite3_step(stmt)==SQLITE_DONE){
                    success=true
                    sqlite3_finalize(stmt)
                    sqlite3_close(db)
                }
            }
            else{
                print("Error in executing query \(sqlite3_errmsg(db))")
            }
        }
        else{
            print("Error in opening DataBase\(sqlite3_errmsg(db))")
        }
        return success
    }
    
    func createTable(){
        let createQuery = "create table if not exists scheduleTable(scheduleName text,selectedRoom text,selectedAppliances text,selectedTime text,selectedDay text)"
        let isSuccess = executeQuery(query: createQuery)
        if(isSuccess){
            print("Table Creation:Success")
        }
        else{
            print("Table creation:Failed")
        }
    }
    
    
    
    func getAllTask(query:String)->(scheduleName:[String],selectedRoom:[String],selectedAppliances:[String],selectedTime:[String],selectedDay:[String]){
        scheduleNameArray.removeAllObjects()
        selectRoomArray.removeAllObjects()
        selectApplianceArray.removeAllObjects()
        selectTimeArray.removeAllObjects()
        selectDayArray.removeAllObjects()
        let dbPath:String = getDatabasePath()
        if (sqlite3_open(dbPath,&db)==SQLITE_OK)
        {
            if(sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK){
                while
                    (sqlite3_step(stmt)==SQLITE_ROW){
                        let scheduleName = String(cString:sqlite3_column_text(stmt, 0))
                        let selectRoom = String(cString:sqlite3_column_text(stmt, 1))
                        let selectAppliance = String(cString:sqlite3_column_text(stmt, 2))
                        let selectTime = String(cString:sqlite3_column_text(stmt, 3))
                        let selectDay = String(cString:sqlite3_column_text(stmt, 4))
                        scheduleNameArray.add(scheduleName)
                        selectRoomArray.add(selectRoom)
                        selectApplianceArray.add(selectAppliance)
                        selectTimeArray.add(selectDay)
                        selectDayArray.add(selectTime)
                
                        
                }
            }
            else{
                print("Error in prepare stmt \(sqlite3_errmsg(db))")
            }
        }
        else{
            print("Error in opening DataBase\(sqlite3_errmsg(db))")
        }
        sqlite3_finalize(stmt)
        sqlite3_close(db)
        return (scheduleNameArray as! [String],selectRoomArray as! [String],selectApplianceArray as! [String],selectTimeArray as! [String],selectDayArray as! [String])
    }
    



}
