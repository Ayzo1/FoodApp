import Foundation

final class AddressesPresenter: AddressesPresenterProtocol {
		
	weak var view: AddressesViewProtocol?
	private var addresses: [Address] = [Address]()
	private var networkingService: NetworkingServiceProtocol?
	private var model: ModelProtocol?
	
	init(view: AddressesViewProtocol) {
		self.view = view
		guard let model: ModelProtocol = ServiceLocator.shared.resolve() else {
			return
		}
		self.model = model
		guard let service: NetworkingServiceProtocol = ServiceLocator.shared.resolve() else {
			return
		}
		networkingService = service
	}
	
	func getAddress(for index: Int) -> Address {
 		addresses[index]
	}
	
	func getAddressesCount() -> Int {
		addresses.count
	}
	
	func newRequest(request: String) {
		networkingService?.fetchData(query: request) { [weak self] result in
			switch result {
			case .failure(let error):
				print(error.localizedDescription)
			case .success(let data):
				let decoder = JSONDecoder()
				do {
					let response = try decoder.decode(Response.self, from: data)
					self?.addresses = response.suggestions
					self?.view?.update()
				} catch {
					print(error.localizedDescription)
				}
			}
		}
	}
	
	func setNewAddress(for index: Int) {
		model?.setNewAddress(address: addresses[index])
	}
}
