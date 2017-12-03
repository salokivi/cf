//
//  Resource.swift
//  CodeServerTestPackageDescription
//
//  Created by Elias Salokivi on 1.12.2017.
//

//import Vapor
//import FluentProvider
//import HTTP
//
//let config = try Config()
//config.preparations.append(Resource.self)
//try config.setup()
//
//final class Resource: Model {
//    var hisId: String
//    var longName: String
//    var phoneNumber: String
//    var location: String
//    var district: String
//    var address: String
//    let storage = Storage()
//
//    init(row: Row) throws {
//        hisId = try row.get("hisId")
//        longName = try row.get("longname")
//        phoneNumber = try row.get("phoneNumber")
//        location = try row.get("location")
//        district = try row.get("district")
//        address = try row get("address")
//    }
//
//    init(hisId: String,
//         longName: String,
//         phoneNumber: String,
//         location: String,
//         district: String,
//         address: String
//        ){
//
//        self.hisId = hisId
//        self.longName = longName
//        self.phoneNumber = phoneNumber
//        self.location = location
//        self.district = district
//        self.address = address
//    }
//
//    func makeRow() throws -> Row {
//        var row = Row()
//        try row.set("hisId", hisId)
//        try row.set("longName", longName)
//        try row.set("phoneNumber", phoneNumber)
//        try row.set("location",location)
//        try row.set("district",district)
//        try row.set("address",address)
//        return row
//    }
//}


// MARK: Fluent Preparation

//extension Resource: Preparation {
//    static func prepare(_ database: Database) throws {
//        try database.create(self) { resources in
//            resources.id()
//            resources.string("hisId")
//            resources.string("longName")
//            resources.string("phoneNumber")
//            resources.string("location")
//            resources.string("district")
//            resources.string("address")
//        }
//    }
//
//    static func revert(_ database: Database) throws {
//        try database.delete(self)
//    }
//}

