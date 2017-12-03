//
//  Ward.swift
//  CodeServerTestPackageDescription
//
//  Created by Elias Salokivi on 1.12.2017.
//

import Vapor
import FluentProvider
import Fluent
import Node

//import HTTP

final class Ward: Model {
    
    var id: Node?
    
    var hisId: String
    var longName: String
    var phoneNumber: String
    var location: String
    var district: String
    var address: String
    let storage = Storage()
    
    init(row: Row) throws {
        hisId = try row.get("hisId")
        longName = try row.get("longname")
        phoneNumber = try row.get("phoneNumber")
        location = try row.get("location")
        district = try row.get("district")
        address = try row.get("address")
    }
    
   
    
//     NodeInitializable
    init(node: Node, in context: Context) throws {
        hisId = try node.get("hisId")
        longName = try node.get("longname")
        phoneNumber = try node.get("phoneNumber")
        location = try node.get("location")
        district = try node.get("district")
        address = try node.get("address")
    }
    
    
//    init(node: Node, in context: Context) throws {
//        hisId = try node.get("hisId")
//        longName = try node.get("longname")
//        phoneNumber = try node.get("phoneNumber")
//        location = try node.get("location")
//        district = try node.get("district")
//        address = try node.get("address")
//    }
//        hisId = try node.extract("hisId")
//        longName = try node.extract("longname")
//        phoneNumber = try node.extract("phoneNumber")
//        location = try node.extract("location")
//        district = try node.extract("district")
//        address = try node.extract("address")
//    }

    // NodeRepresentable
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id" : id,
            "hisId" : hisId,
            "longName" : longName,
            "phoneNumber" : phoneNumber,
            "location" : location,
            "district" : district,
            "address" : address])
    }
    
    init(hisId: String,
         longName: String,
         phoneNumber: String,
         location: String,
         district: String,
         address: String
        ){
        
        self.hisId = hisId
        self.longName = longName
        self.phoneNumber = phoneNumber
        self.location = location
        self.district = district
        self.address = address
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("hisId", hisId)
        try row.set("longName", longName)
        try row.set("phoneNumber", phoneNumber)
        try row.set("location",location)
        try row.set("district",district)
        try row.set("address",address)
        return row
    }
    
}

extension Ward: ResponseRepresentable { }

extension Ward: JSONRepresentable {
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("hisId", hisId)
        try json.set("longName", longName)
        try json.set("phoneNumber", phoneNumber)
        try json.set("location",location)
        try json.set("district",district)
        try json.set("address",address)
        return json
    }
}
