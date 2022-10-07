import Foundation
import UIKit

final class CatalogHeaderView: UICollectionReusableView {
	
	static let identifirer = String(describing: CatalogHeaderView.self)
	
	private lazy var salesLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.headersFont
		label.text = "Каталог"
		return label
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
	}
}
