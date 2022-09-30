import UIKit

class SaleCollectionViewCell: UICollectionViewCell {
    
	static let identifirer = String(describing: SaleCollectionViewCell.self)
	
	private lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.font = Constants.font
		label.textColor = Constants.textColor
		return label
	}()
	
	private lazy var weightLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = Constants.smallTextColor
		label.font = Constants.font
		return label
	}()
	
	private lazy var saleView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .red
		return view
	}()
	
	private lazy var saleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .white
		label.font = Constants.smallFont
		return label
	}()
	
	private lazy var priceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	private lazy var oldPriceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .red
		label.font = Constants.smallFont
		return label
	}()
	
	private lazy var addButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(systemName: "plus"), for: .normal)
		button.backgroundColor = .yellow
		button.tintColor = .black
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configurate()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setData(name: String, image: UIImage, price: String, oldPrice: String, sale: String, weight: String) {
		imageView.image = image
		nameLabel.text = name
		priceLabel.text = "\(price) Р"
		weightLabel.text = "\(weight)г"
		saleLabel.text = "\(sale)%"
		
		let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "\(oldPrice) Р")
		attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
		oldPriceLabel.attributedText = attributeString
	}
	
	override func prepareForReuse() {
		imageView.image = nil
		nameLabel.text = ""
		priceLabel.text = ""
		weightLabel.text = ""
		saleLabel.text = ""
	}
	
	private func configurate() {
		setupImageView()
		setupNameLabel()
		
		contentView.addSubview(weightLabel)
		weightLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
		weightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
		contentView.addSubview(priceLabel)
		priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
		priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
		
		setupAddButton()
		setupOldPriceLabel()
		setupSaleView()
		
		contentView.backgroundColor = Constants.secondBackgroundColor
		contentView.layer.cornerRadius = 5
		addButton.layer.cornerRadius = 15
	}
	
	private func setupImageView() {
		contentView.addSubview(imageView)
		imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
		imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
		imageView.heightAnchor.constraint(equalToConstant: 108).isActive = true
	}
	
	private func setupNameLabel() {
		contentView.addSubview(nameLabel)
		nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
		nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
		nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
		nameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
	}
	
	private func setupAddButton() {
		contentView.addSubview(addButton)
		addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
		addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
		addButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
		addButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
	}
	
	private func setupOldPriceLabel() {
		contentView.addSubview(oldPriceLabel)
		oldPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor).isActive = true
		oldPriceLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -2).isActive = true
	}
	
	private func setupSaleView() {
		imageView.addSubview(saleView)
		saleView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 5).isActive = true
		saleView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5).isActive = true
		saleView.layer.cornerRadius = 5
		saleView.heightAnchor.constraint(equalToConstant: 15).isActive = true
		saleView.widthAnchor.constraint(equalToConstant: 35).isActive = true
		
		saleView.addSubview(saleLabel)
		saleLabel.centerYAnchor.constraint(equalTo: saleView.centerYAnchor).isActive = true
		saleLabel.centerXAnchor.constraint(equalTo: saleView.centerXAnchor).isActive = true
	}
}
