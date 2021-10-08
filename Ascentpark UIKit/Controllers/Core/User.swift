//
//  User.swift
//  Ascentpark UIKit
//
//  Created by Nishant Kumar on 08/10/21.
//

import Foundation



struct User : Codable {
    var user_id : Int
    var first_name : String
    var last_name : String
    var follow : Int
    var profile_picture : String
    var user_name : String
    var followings : Followings
}

extension User: Identifiable {
    var id: Int { return user_id }
}
