import Vapor

extension Droplet {
    func setupRoutes() throws {

        
        get("thewards", Ward.parameter) { req in
            
            let tmpWard =  Ward.init(hisId: "TKS4_1", longName: "A1 Akuutti psykoosiosasto Turku", phoneNumber: "023145163", location: "Turku", district: "Turku", address: "Kunnallissairaalantie 20, Turku Talo 4, 1.krs")
            try tmpWard.save()
            let tmpWard2 =  Ward.init(hisId: "L5BP", longName: "Fysioterapia Loimaa", phoneNumber: "023130000", location: "Loimaa", district: "Loimaa", address: "Seppälänkatu 15-17, Loimaa Päärakennus B-osa. Pääovi, Pohjakerros")
            try tmpWard2.save()

            let wards = [tmpWard,tmpWard2]
            
            print(wards.count)
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
