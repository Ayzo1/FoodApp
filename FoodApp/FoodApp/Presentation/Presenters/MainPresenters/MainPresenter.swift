import Foundation

final class MainPresenter: MainPresenterProtocol {
	
	private var model: ModelProtocol?
	weak var view: MainViewProtocol?
	
	init(view: MainViewProtocol) {
		self.view = view
		guard let model: ModelProtocol = ServiceLocator.shared.resolve() else {
			return
		}
		self.model = model
		
		self.model?.recieveNewAddress = { [weak self] address in
			self?.view?.setNewAddress(address: address.value)
		}
	}
	
	func getCurrentAddress() -> String {
		model?.currentAddress.value ?? ""
	}
}
