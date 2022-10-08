import Foundation
import UIKit

final class SalesHeaderView: UICollectionReusableView {
	
	static let identifirer = String(describing: SalesHeaderView.self)
	
	private lazy var salesLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.headersFont
		label.text = "Акции"
		return label
	}()
	
	private lazy var salesButton: UIButton = {
		let button = UIButton()
		button.setTitle("Смотреть все", for: .normal)
		button.setImage(UIImage(named: "vector"), for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.semanticContentAttribute = .forceRightToLeft
		button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
		button.backgroundColor = Constants.secondBackgroundColor
		button.tintColor = Constants.textColor
		button.setTitleColor(Constants.textColor, for: .normal)
		button.titleLabel?.font = Constants.font
		button.layer.cornerRadius = 10
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configurate()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configurate() {
		self.addSubview(salesLabel)
		salesLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		salesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
		self.addSubview(salesButton)
		salesButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		salesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
		salesButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
		salesButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
	}
}
