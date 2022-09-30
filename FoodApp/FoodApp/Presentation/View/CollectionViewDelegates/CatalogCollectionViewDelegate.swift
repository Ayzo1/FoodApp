import Foundation
import UIKit

final class CatalogCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
		
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return MockData.catalog.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.identifirer, for: indexPath) as? CatalogCollectionViewCell else {
			return UICollectionViewCell()
		}
		cell.setData(image: MockData.catalog[indexPath.row].image, text: MockData.catalog[indexPath.row].name)
		cell.backgroundColor = MockData.catalog[indexPath.row].color
		return cell
	}
}

