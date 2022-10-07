import Foundation

protocol MainPresenterProtocol {
	
	func getCurrentAddress() -> String
	func getBlocksCount() -> Int
	func getItemsCount(blockIndex: Int) -> Int
	func getPromoItem(index: Int) -> Promo
	func getBannerItem(index: Int) -> Banner
	func getSaleItem(index: Int) -> Sale
	func getCatalogItem(index: Int) -> Catalog
}
