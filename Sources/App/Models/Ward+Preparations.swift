//
//  Ward+Preparations.swift
//  CodeServerTestPackageDescription
//
//  Created by Elias Salokivi on 1.12.2017.
//

import Foundation
import Vapor
import Fluent
import FluentProvider

extension Ward: Preparation {
    
    static func prepare(_ database: Database) throws {
        try database.create(self) { wards in
            wards.id()
            wards.string("hisId")
            wards.string("longName")
            wards.string("phoneNumber")
            wards.string("location")
            wards.string("district")
            wards.string("address")
        }
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}
