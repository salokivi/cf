import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }
        
        get("ward") { req in
            var json = JSON()
            try json.set("ward", "set")
            
//            let ward =  Ward.init(hisId: "hisIdTest", longName: "longNameTest", phoneNumber: "phoneNumberTesti", location: "locationTest", district: "districtTest", address: "addressTest")

//            try ward.save()
//            print(ward.id) // the newly saved ward's id
            
            return json
        }

        get("plaintext") { req in
            return "Hello, world"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
