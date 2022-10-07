import UIKit

class AddressesViewController: UIViewController, AddressesViewProtocol {
	
	// MARK: - Private properties
	
	private var presenter: AddressesPresenterProtocol?
	
	private lazy var textField: UITextField = {
		let textField = UITextField()
		textField.borderStyle = .none
		textField.clearButtonMode = .always
		textField.leftViewMode = .always
		textField.leftView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.placeholder = "Введите адрес"
		textField.tintColor = .gray
		textField.font = .systemFont(ofSize: 16)
		textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
		return textField
	}()
	
	private lazy var addressesTable: UITableView = {
		let table = UITableView()
		table.translatesAutoresizingMaskIntoConstraints = false
		table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
		table.separatorStyle = .none
		return table
	}()
	
	private lazy var locationImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(systemName: "location")
		imageView.tintColor = .gray
		return imageView
	}()

	private lazy var locationLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 17)
		label.textColor = Constants.textColor
		label.text = "Текущее местоположение"
		return label
	}()
	
	private lazy var locationView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		
		presenter = AddressesPresenter(view: self)
		
		addressesTable.delegate = self
		addressesTable.dataSource = self
		
		setupSubviews()
		view.layoutSubviews()
		
		let bottomLine = CALayer()
		bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: view.frame.width-20, height: 1.0)
		bottomLine.backgroundColor = UIColor.lightGray.cgColor
		textField.layer.addSublayer(bottomLine)
    }
	
	// MARK: - AddressesViewProtocol
	
	func update() {
		DispatchQueue.main.async { [weak self] in
			self?.addressesTable.reloadData()
		}
	}
	
	// MARK: - Private methods
	
	private func setupSubviews() {
		setupTextField()
		setupLocationView()
		setupTableView()
	}
	
	private func setupTextField() {
		view.addSubview(textField)
		textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
		textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
		textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
		textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
	}
	
	private func setupLocationView() {
		view.addSubview(locationView)
		locationView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
		locationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		locationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		locationView.heightAnchor.constraint(equalToConstant: 20).isActive = true
		
		locationView.addSubview(locationImageView)
		locationImageView.centerYAnchor.constraint(equalTo: locationView.centerYAnchor).isActive = true
		locationImageView.leadingAnchor.constraint(equalTo: locationView.leadingAnchor, constant: 20).isActive = true
		locationImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
		locationImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
		
		locationView.addSubview(locationLabel)
		locationLabel.centerYAnchor.constraint(equalTo: locationView.centerYAnchor).isActive = true
		locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 10).isActive = true
	}
	
	private func setupTableView() {
		view.addSubview(addressesTable)
		addressesTable.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 10).isActive = true
		addressesTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		addressesTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		addressesTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
	}
	
	// MARK: - @objc private properties
	
	@objc private func textFieldDidChange() {
		guard let text = textField.text else {
			return
		}
		presenter?.newRequest(request: text)
	}
}

extension AddressesViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter?.getAddressesCount() ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
		guard let address = presenter?.getAddress(for: indexPath.row) else {
			return cell
		}
		cell.textLabel?.text = address.value
		cell.imageView?.image = UIImage(named: "locationPin")
		if address.data.city != nil && address.data.region != nil && address.data.country != nil {
			let subtitle = "\(address.data.city!), \(address.data.region!), \(address.data.country!)"
			cell.detailTextLabel?.text = subtitle
			cell.detailTextLabel?.textColor = Constants.smallTextColor
		}
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter?.setNewAddress(for: indexPath.row)
		self.dismiss(animated: true, completion: nil)
	}
}
