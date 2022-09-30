import Foundation

protocol ModelProtocol {
	
	var currentAddress: Address { get }
	var recieveNewAddress: ((Address) -> Void)? { get set }
	func setNewAddress(address: Address)
}
