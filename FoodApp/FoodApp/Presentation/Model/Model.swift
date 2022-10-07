import Foundation

final class Model: ModelProtocol {
	
	var currentAddress = Address(value: "Пушкинская, 100", data: AddressData(country: "", region: "", city: ""))
	var recieveNewAddress: ((Address) -> Void)?
	
	func setNewAddress(address: Address) {
		currentAddress = address
		recieveNewAddress?(address)
	}
}
