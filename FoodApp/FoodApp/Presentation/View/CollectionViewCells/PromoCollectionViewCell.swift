import UIKit

class PromoCollectionViewCell: UICollectionViewCell {
	
	static let identifirer = String(describing: PromoCollectionViewCell.self)
	
	private lazy var imageView: UIImageView = {
		let view = UIImageView()
		view.contentMode = .scaleAspectFit
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var textLabel: UILabel = {
		let label = UILabel()
		label.font = Constants.font
		label.textColor = Constants.textColor
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
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
    
	func configurate() {
		contentView.addSubview(imageView)
		imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
		imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
		imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
		
		contentView.addSubview(textLabel)
		textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
		textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
		textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
		textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
	}
}
