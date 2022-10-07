import Foundation

struct Address: Codable {
	
	let value: String
	let data: AddressData
}

struct Response: Codable {
	let suggestions: [Address]
}

struct AddressData: Codable {
	let country: String?
	let region: String?
	let city: String?
	
	enum CodingKeys: String, CodingKey {
		case country
		case region = "region_with_type"
		case city
	}
}
