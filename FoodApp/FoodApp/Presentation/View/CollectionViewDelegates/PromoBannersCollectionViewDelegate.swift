import Foundation
import UIKit

final class PromoBannersCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return MockData.banners.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifirer, for: indexPath) as? BannerCollectionViewCell else {
			return UICollectionViewCell()
		}
		cell.setImage(image: MockData.banners[indexPath.row])
		return cell
	}
}
