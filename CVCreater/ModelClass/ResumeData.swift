//
//  ResumeData.swift
//  CVCreater
//
//  Created by Saranya Rathinasamy on 29/05/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import Foundation
import UIKit
class Model:NSObject
{
    var personalInfo:[String:String] = [:]
    var Education:[String:String] = [:]
    var technicalExpertise:[String:String] = [:]
    var projectExp:[String:String] = [:]
    var pastExp:[String:String] = [:]
    var AdditionalInfo:String = ""
    
    let sharedInstance = Model()
    
    var dataDict:[String:Any] {
        get{
            return["personalInfo":personalInfo,
                   "education":Education,
                   "technicalExpertise":technicalExpertise,
                   "projectExp":projectExp,
                   "pastExp":pastExp,
                   "AdditionalInfo":AdditionalInfo
            ] ;
        }
        set(newDataDict){
            self.dataDict = newDataDict
        }
    }
    //Saving data
    func saveData() -> Bool {

        var jsonData:Data;
        do{
            jsonData = try JSONSerialization.data(withJSONObject: dataDict, options: .init(rawValue:0)) as Data
             return writeToURL(data: jsonData)
        }
        catch
        {
            print("Error while saving!!")
        }
        return false
    }
    //Writing to URL
    func writeToURL(data:Data) -> Bool {
        if let encodedData = try? JSONEncoder().encode(data){
            let path = ""
            let pathURL = URL(fileURLWithPath: path)
            do{
                try encodedData.write(to:pathURL)
            }
            catch
            {
                print("Error while writing!!")
            }
        }
       return false
        
    }
    
    //Retrieving data from URL
    func retrieveData() -> Void {
        let url = URL(fileURLWithPath:"")
        let request = NSURLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let dataObj = data{
                self.parsing(data: dataObj)
            }
            
        }
        task.resume()
    }
    //Parsing the data after retrieving
    func parsing(data:Data) -> Void {
        var dict:[String:Any] = [:]
        do{
            dict = try JSONSerialization.jsonObject(with: data) as! Dictionary
            dataDict = dict
        }
        catch{
            print("Error in parsing")
        }
    }
}
