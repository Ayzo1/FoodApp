import UIKit

class CatalogCollectionViewCell: UICollectionViewCell {
	
	static let identifirer = String(describing: CatalogCollectionViewCell.self)
	
	private lazy var imageView: UIImageView = {
		let view = UIImageView()
		view.contentMode = .scaleAspectFit
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var textLabel: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 14)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configurate()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setData(image: UIImage, text: String) {
		imageView.image = image
		textLabel.text = text
	}
	
	override func prepareForReuse() {
		imageView.image = nil
		textLabel.text = ""
	}
	
	private func configurate() {
		contentView.addSubview(imageView)
		imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
		imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
		imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
		
		contentView.addSubview(textLabel)
		textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
		textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
		textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
		textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true

		contentView.layer.cornerRadius = 20
	}
}
