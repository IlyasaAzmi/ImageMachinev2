//
//  Machine.swift
//  ImageMachinev2
//
//  Created by Ilyasa Azmi on 12/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Machine: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
//    var rating: Int
    var type: String
    var qrcode: Int
    var lastMaintenanceDate: Date
    
    //MARK: Types
     
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let type = "type"
        static let qrcode = "qrcode"
        static let lastDate = "date"
    }
    
    //MARK: Initialization
     
    init?(name: String, photo: UIImage?, type: String, qrcode: Int, date: Date) {
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }

        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
//        self.rating = rating
        self.type = type
        self.qrcode = qrcode
        self.lastMaintenanceDate = date
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(type, forKey: PropertyKey.type)
        aCoder.encode(qrcode, forKey: PropertyKey.qrcode)
        aCoder.encode(lastMaintenanceDate, forKey: PropertyKey.lastDate)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
//        guard (aDecoder.decodeObject(forKey: PropertyKey.name) as? String) != nil else {
//            os_log("Unable to decode the name for a Machine object.", log: OSLog.default, type: .debug)
//            return nil
//        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let name = aDecoder.decodeObject(forKey: PropertyKey.name) as! String
        
        let type = aDecoder.decodeObject(forKey: PropertyKey.type) as! String
        
//        guard (aDecoder.decodeObject(forKey: PropertyKey.type) as? String) != nil else {
//            os_log("Unable to decode the name for a Machine object.", log: OSLog.default, type: .debug)
//            return nil
//        }
        
        let qrcode = aDecoder.decodeInteger(forKey: PropertyKey.qrcode)
        
//        guard (aDecoder.decodeObject(forKey: PropertyKey.lastDate) as? Date) != nil else {
//            os_log("Unable to decode the name for a Machine object.", log: OSLog.default, type: .debug)
//            return nil
//        }
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, type: type, qrcode: qrcode, date: Date() )
    }
    
}
