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
		button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.semanticContentAttribute = .forceRightToLeft
		button.backgroundColor = Constants.secondBackgroundColor
		button.tintColor = .black
		button.setTitleColor(Constants.textColor, for: .normal)
		button.titleLabel?.font = Constants.font
		button.layer.cornerRadius = 5
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
	}
}
