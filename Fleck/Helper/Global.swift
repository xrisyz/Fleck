//
//  Global.swift
//  Fleck
//
//  Created by macuser1 on 23/10/2017.
//  Copyright © 2017 Neptune. All rights reserved.
//

import UIKit
import Firebase

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

struct Theme {
    static let chatBubbleOutgoing : UIColor = UIColor(r: 0, g: 136, b: 249)
    static let chatBubbleIncoming : UIColor = UIColor(r: 240, g: 240, b: 240)
    static let loginBackgroundColor : UIColor = UIColor(r: 61, g: 91, b: 151)
    static let UploadImage : UIImage? = UIImage(named: "camera")
}


//Contains Firbase DB Node Names
enum FDNodeRef: String {
    case users
    
    func returnRootNode() -> DatabaseReference {
        return Database.database().reference()
    }
    
    /// returns the 'DatabaseReference' of "users" Node Reference inside of your Firebase Database
    static func userNode() -> DatabaseReference {
        let ref = Database.database().reference().child("users")
        return ref
    }
    
     /// returns the 'StorageReference' of "message_images" Node Reference inside of your Firebase Storage
    static func uploadMesaageImageNode() -> StorageReference {
        let ref = Storage.storage().reference().child("message_images")
        return ref
    }
    
    /// returns the storage reference path where images sent from messages are stored
    static func uploadMessageImage(withName name: String) -> StorageReference {
        let ref = uploadMesaageImageNode().child("\(name).jpg")
        return ref
    }
    
    /// returns the 'DatabaseReference' of "users" Node Reference inside of your Firebase Database
    static func nameNode() -> String? {
        
        return "name"
    }
    
    static func emailNode() -> String {
        return "email"
    }
    
    static func messagesNode() ->String {
        return "messages"
    }
    
    static func profileImageURLNode() -> String {
        return "profileImageUrl"
    }
    
    static func userMessagesNode() -> String {
        return "user-messages"
    }
}
