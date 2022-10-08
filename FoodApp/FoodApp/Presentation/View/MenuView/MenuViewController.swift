import UIKit

class MenuViewController: UIViewController, UIGestureRecognizerDelegate {
	
	// MARK: - Private properties
	
	private let labelTopAnchorConstant: CGFloat = 20
	private let leadingAnchorConstant: CGFloat = 20
	
	private lazy var avatarImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "avatar")
		imageView.tintColor = .gray
		return imageView
	}()

	private lazy var nameLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuBoldFont
		label.text = "Иванов Иван"
		return label
	}()
	
	private lazy var numberLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuFont
		label.text = "+7 912 555-77-44"
		return label
	}()
	
	private lazy var headerView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var paymentView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var paymentLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuBoldFont
		label.text = "Оплата"
		return label
	}()
	
	private lazy var cardNumberLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuFont
		label.textColor = Constants.smallTextColor
		label.text = "Карта *4678"
		return label
	}()
	
	private lazy var addressesLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuBoldFont
		label.text = "Мои адреса"
		return label
	}()
	
	private lazy var ordersLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuBoldFont
		label.text = "Мои заказы"
		return label
	}()
	
	private lazy var favoritesLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuBoldFont
		label.text = "Избранное"
		return label
	}()
	
	private lazy var newsLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuBoldFont
		label.text = "Новости"
		return label
	}()
	
	private lazy var couponsLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuBoldFont
		label.text = "Купоны"
		return label
	}()
	
	private lazy var aboutLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuBoldFont
		label.text = "О нас"
		return label
	}()
	
	private lazy var inviteFriendsLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuBoldFont
		label.text = "Пригласить друзей"
		return label
	}()
	
	private lazy var settingsLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuBoldFont
		label.text = "Настройки"
		return label
	}()
	
	private lazy var contactsImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.image = UIImage(named: "contacts")
		imageView.tintColor = .gray
		return imageView
	}()

	private lazy var contactsLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.menuFont
		label.textColor = Constants.smallTextColor
		label.numberOfLines = 2
		label.lineBreakMode = .byWordWrapping
		label.text = "Связаться с нами"
		return label
	}()
	
	private lazy var contactsView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	// MARK: - Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = Constants.backgroundColor
		view.layer.cornerRadius = 20
		setupSubviews()
		
		view.layoutSubviews()
		
		let bottomLine = CALayer()
		bottomLine.frame = CGRect(x: 0.0, y: headerView.frame.height - 1, width: view.frame.width * 7 / 8, height: 1.0)
		bottomLine.backgroundColor = UIColor.lightGray.cgColor
		headerView.layer.addSublayer(bottomLine)
    }
	
	// MARK: - Private methods
	
	private func setupSubviews() {
		setupHeaderView()
		setupPaymentView()
		setupMenuLabels()
		setupContactsView()
	}
	
	private func setupHeaderView() {
		view.addSubview(headerView)
		headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		headerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
		
		headerView.addSubview(avatarImageView)
		avatarImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
		avatarImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: leadingAnchorConstant).isActive = true
		avatarImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		avatarImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
		
		headerView.addSubview(nameLabel)
		nameLabel.bottomAnchor.constraint(equalTo: headerView.centerYAnchor, constant: -2).isActive = true
		nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: leadingAnchorConstant).isActive = true
		
		headerView.addSubview(numberLabel)
		numberLabel.topAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 2).isActive = true
		numberLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: leadingAnchorConstant).isActive = true
	}
	
	private func setupPaymentView() {
		view.addSubview(paymentView)
		paymentView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10).isActive = true
		paymentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		paymentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		paymentView.heightAnchor.constraint(equalToConstant: 60).isActive = true
		
		paymentView.addSubview(paymentLabel)
		paymentLabel.bottomAnchor.constraint(equalTo: paymentView.centerYAnchor, constant: -2).isActive = true
		paymentLabel.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: leadingAnchorConstant).isActive = true
		
		paymentView.addSubview(cardNumberLabel)
		cardNumberLabel.topAnchor.constraint(equalTo: paymentView.centerYAnchor, constant: 2).isActive = true
		cardNumberLabel.leadingAnchor.constraint(equalTo: paymentView.leadingAnchor, constant: leadingAnchorConstant).isActive = true
	}
	
	private func setupMenuLabels() {
		view.addSubview(addressesLabel)
		addressesLabel.topAnchor.constraint(equalTo: paymentView.bottomAnchor, constant: labelTopAnchorConstant).isActive = true
		addressesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingAnchorConstant).isActive = true
		
		view.addSubview(ordersLabel)
		ordersLabel.topAnchor.constraint(equalTo: addressesLabel.bottomAnchor, constant: labelTopAnchorConstant).isActive = true
		ordersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingAnchorConstant).isActive = true
		
		view.addSubview(favoritesLabel)
		favoritesLabel.topAnchor.constraint(equalTo: ordersLabel.bottomAnchor, constant: labelTopAnchorConstant).isActive = true
		favoritesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingAnchorConstant).isActive = true
		
		view.addSubview(newsLabel)
		newsLabel.topAnchor.constraint(equalTo: favoritesLabel.bottomAnchor, constant: labelTopAnchorConstant).isActive = true
		newsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingAnchorConstant).isActive = true
		
		view.addSubview(couponsLabel)
		couponsLabel.topAnchor.constraint(equalTo: newsLabel.bottomAnchor, constant: labelTopAnchorConstant).isActive = true
		couponsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingAnchorConstant).isActive = true
		
		view.addSubview(aboutLabel)
		aboutLabel.topAnchor.constraint(equalTo: couponsLabel.bottomAnchor, constant: labelTopAnchorConstant).isActive = true
		aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingAnchorConstant).isActive = true
		
		view.addSubview(inviteFriendsLabel)
		inviteFriendsLabel.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: labelTopAnchorConstant).isActive = true
		inviteFriendsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingAnchorConstant).isActive = true
		
		view.addSubview(settingsLabel)
		settingsLabel.topAnchor.constraint(equalTo: inviteFriendsLabel.bottomAnchor, constant: labelTopAnchorConstant).isActive = true
		settingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingAnchorConstant).isActive = true
	}
	
	private func setupContactsView() {
		view.addSubview(contactsView)
		contactsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
		contactsView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		contactsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		contactsView.heightAnchor.constraint(equalToConstant: 60).isActive = true
		
		contactsView.addSubview(contactsImageView)
		contactsImageView.centerYAnchor.constraint(equalTo: contactsView.centerYAnchor).isActive = true
		contactsImageView.leadingAnchor.constraint(equalTo: contactsView.leadingAnchor, constant: leadingAnchorConstant).isActive = true
		contactsImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
		contactsImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
		
		contactsView.addSubview(contactsLabel)
		contactsLabel.centerYAnchor.constraint(equalTo: contactsView.centerYAnchor).isActive = true
		contactsLabel.leadingAnchor.constraint(equalTo: contactsImageView.trailingAnchor, constant: leadingAnchorConstant).isActive = true
		contactsLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
	}
}
