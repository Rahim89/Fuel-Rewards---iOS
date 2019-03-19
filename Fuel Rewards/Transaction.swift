//
//  Transaction.swift
//  Fuel Rewards
//
//  Created by MyMac on 3/19/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import Foundation

struct Transaction: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String

}
