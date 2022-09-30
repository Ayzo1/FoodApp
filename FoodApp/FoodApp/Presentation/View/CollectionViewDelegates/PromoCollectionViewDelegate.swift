import Foundation
import UIKit

final class PromoCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return MockData.promo.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionViewCell.identifirer, for: indexPath) as? PromoCollectionViewCell else {
			return UICollectionViewCell()
		}
		cell.setData(image: MockData.promo[indexPath.row].image, text: MockData.promo[indexPath.row].name)
		return cell
	}
}
