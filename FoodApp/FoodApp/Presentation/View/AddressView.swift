import UIKit

class AddressView: UIView {
	
	private lazy var deliveryLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Доставка"
		label.textColor = .gray
		label.font = .systemFont(ofSize: 12)
		return label
	}()
	
	private lazy var addressLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 17)
		label.numberOfLines = 1
		label.lineBreakMode = .byTruncatingTail
		label.text = "Пушкинская, 299"
		return label
	}()
	
	private lazy var arrowView: UIImageView = {
		let view = UIImageView(image: UIImage(systemName: "chevron.down"))
		view.translatesAutoresizingMaskIntoConstraints = false
		view.tintColor = .lightGray
		return view
	}()
	
	func configurate() {
		self.addSubview(deliveryLabel)
		deliveryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
		deliveryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
		self.addSubview(addressLabel)
		addressLabel.topAnchor.constraint(equalTo: deliveryLabel.bottomAnchor, constant: 2).isActive = true
		addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
		self.addSubview(arrowView)
		addressLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
		arrowView.centerYAnchor.constraint(equalTo: addressLabel.centerYAnchor).isActive = true
		arrowView.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor, constant: 10).isActive = true
		arrowView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
	}
	
	func setAddress(address: String) {
		addressLabel.text = address
	}
}
