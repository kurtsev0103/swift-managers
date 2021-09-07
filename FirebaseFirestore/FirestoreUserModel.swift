//  ************************  //
//  FirestoreUserModel.swift  //
//  ------------------------  //
//         Created by         //
//     Oleksandr Kurtsev      //
//  ------------------------  //
//   github:    kurtsev0103   //
//   linkedin:  kurtsev0103   //
//   facebook:  kurtsev0103   //
//  ------------------------  //
//      Copyright © 2021      //
//  ************************  //

import UIKit
import FirebaseFirestore

struct FirestoreUserModel: Hashable, Decodable {
    
    var firstName: String
    var lastName: String
    var email: String
    var bornDate: String
    var gender: String
    var phone: String
    var address: String
    var avatarStringURL: String
    var id: String
    
    init() {
        firstName = ""
        lastName = ""
        email = ""
        bornDate = ""
        gender = ""
        phone = ""
        address = ""
        avatarStringURL = ""
        id = ""
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else { return nil }
        guard let firstName = data["firstName"] as? String,
              let lastName = data["lastName"] as? String,
              let email = data["email"] as? String,
              let bornDate = data["bornDate"] as? String,
              let gender = data["gender"] as? String,
              let phone = data["phone"] as? String,
              let address = data["address"] as? String,
              let avatarStringURL = data["avatarStringURL"] as? String,
              let id = data["id"] as? String else { return nil }
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.bornDate = bornDate
        self.gender = gender
        self.phone = phone
        self.address = address
        self.avatarStringURL = avatarStringURL
        self.id = id
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let firstName = data["firstName"] as? String,
              let lastName = data["lastName"] as? String,
              let email = data["email"] as? String,
              let bornDate = data["bornDate"] as? String,
              let gender = data["gender"] as? String,
              let phone = data["phone"] as? String,
              let address = data["address"] as? String,
              let avatarStringURL = data["avatarStringURL"] as? String,
              let id = data["id"] as? String else { return nil }
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.bornDate = bornDate
        self.gender = gender
        self.phone = phone
        self.address = address
        self.avatarStringURL = avatarStringURL
        self.id = id
    }
    
    var representation: [String: Any] {
        var rep = ["id": id]
        rep["firstName"] = firstName
        rep["lastName"] = lastName
        rep["email"] = email
        rep["bornDate"] = bornDate
        rep["gender"] = gender
        rep["phone"] = phone
        rep["address"] = address
        rep["avatarStringURL"] = avatarStringURL
        return rep
    }
}
