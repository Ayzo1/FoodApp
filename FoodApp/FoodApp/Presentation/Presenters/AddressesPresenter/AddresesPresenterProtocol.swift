import Foundation

protocol AddressesPresenterProtocol {
	
	func getAddress(for index: Int) -> Address
	func getAddressesCount() -> Int
	func newRequest(request: String)
	func setNewAddress(for index: Int)
}
