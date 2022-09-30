import Foundation

struct Address: Codable {
	
	let value: String
}

struct Response: Codable {
	let suggestions: [Address]
}
