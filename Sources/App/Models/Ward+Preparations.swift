//
//  Ward+Preparations.swift
//  CodeServerTestPackageDescription
//
//  Created by Elias Salokivi on 1.12.2017.
//

import Fluent
import FluentProvider

extension Ward: Preparation {
    static func prepare(_ db: Database) throws {
        try db.create(self) { wards in
            wards.id()
            wards.string("hisId")
            wards.string("longName")
            wards.string("phoneNumber")
            wards.string("location")
            wards.string("district")
            wards.string("address")
        }
    }
    
    static func revert(_ db: Database) throws {
        try db.delete(self)
    }
}
