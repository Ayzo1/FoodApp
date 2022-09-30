import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
	
	static let identifirer = String(describing: BannerCollectionViewCell.self)
    
	private lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configurate()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setImage(image: UIImage) {
		imageView.image = image
	}
	
	func configurate() {
		contentView.addSubview(imageView)
		imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
		imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
		imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
	}
}
