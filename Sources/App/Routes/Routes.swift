import Vapor

extension Droplet {
    func setupRoutes() throws {
        
        get("404") { req in
            throw Abort(.notFound)
        }
        
            post("post") { req in
                guard let name = req.data["name"]?.string else {
                    throw Abort.badRequest
                }
                return try JSON(node: ["message": "Hello \(name)"])
            }
        
        get("") { req in
            return "hello"
        }
        ///http://localhost:8080/thewards/1
        get("thewards", Ward.parameter) { req in
            
            let tmpWard =  Ward.init(hisId: "TKS4_1", longName: "A1 Akuutti psykoosiosasto Turku", phoneNumber: "023145163", location: "Turku", district: "Turku", address: "Kunnallissairaalantie 20, Turku Talo 4, 1.krs")
            try tmpWard.save()
            let tmpWard2 =  Ward.init(hisId: "L5BP", longName: "Fysioterapia Loimaa", phoneNumber: "023130000", location: "Loimaa", district: "Loimaa", address: "Seppälänkatu 15-17, Loimaa Päärakennus B-osa. Pääovi, Pohjakerros")
            try tmpWard2.save()

            let wards = [tmpWard,tmpWard2]
            
            print(wards.count)
            
            let filteredWards = try Ward.makeQuery().filter("phoneNumber", .contains, "02").all()
            print(filteredWards.count)
//
//            var json = JSON()
//            try json.set("ward", "set")
//
//            for ward in wards {
//                print(try ward.makeJSON())
//            }
            
//            let ward = try req.parameters.next(Ward.self)
//            return try wards.first!.makeJSON()
            return try JSON(node: ["wards": [wards]
                ])

        }

        get("info") { req in
            return req.description
        }

        get("description") { req in
            return req.description
        }
        
        try resource("posts", PostController.self)
    }
}
