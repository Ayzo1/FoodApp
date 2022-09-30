import Foundation
import UIKit

final class SalesCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 7
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCollectionViewCell.identifirer, for: indexPath) as? SaleCollectionViewCell else {
			return UICollectionViewCell()
		}
		let sale = MockData.sales[indexPath.row]
		cell.setData(name: sale.name, image: sale.image, price: sale.price, oldPrice: sale.oldPrice, sale: sale.sale, weight: sale.weight)
		return cell
	}
}
