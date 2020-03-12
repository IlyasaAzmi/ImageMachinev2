//
//  Machine.swift
//  ImageMachinev2
//
//  Created by Ilyasa Azmi on 12/03/20.
//  Copyright © 2020 Ilyasa Azmi. All rights reserved.
//

import Foundation
import UIKit

class Machine {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
//    var rating: Int
    var type: String
    var qrcode: Int
    var lastMaintenanceDate: Date
    
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
    
}
