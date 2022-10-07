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
	
	func getBlocksCount() -> Int{
		return 4
	}
	
	func getItemsCount(blockIndex: Int) -> Int {
		switch blockIndex {
		case 0:
			return MockData.promo.count
		case 1:
			return MockData.banners.count
		case 2:
			return MockData.sales.count
		case 3:
			return MockData.catalog.count
		default:
			return 0
		}
	}
	
	func getPromoItem(index: Int) -> Promo {
		return MockData.promo[index]
	}
	
	func getBannerItem(index: Int) -> Banner {
		return MockData.banners[index]
	}
	
	func getSaleItem(index: Int) -> Sale {
		return MockData.sales[index]
	}
	
	func getCatalogItem(index: Int) -> Catalog {
		return MockData.catalog[index]
	}
}
