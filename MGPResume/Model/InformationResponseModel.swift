
import Foundation

struct InformationResponseModel: Codable {
    var name: String
    var city: String
    var telephoneNumber: String
    var email: String
    var birthday: String
    var objective: String
    var education: [Education]?
    var experience: [Experience]?
}

struct Education: Codable {
    var university: String
    var date: String
}

struct Experience: Codable {
    var name: String
    var date: String
    var role: String
    var descripcion: String
    var image: String
}
