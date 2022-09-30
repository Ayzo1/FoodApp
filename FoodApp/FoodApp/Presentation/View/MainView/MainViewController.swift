import UIKit

class MainViewController: UIViewController, MainViewProtocol, UIGestureRecognizerDelegate {

	// MARK: - Private properties
	
	private var presenter: MainPresenterProtocol?
		
	private var favoritesButton: UIBarButtonItem = {
		let button = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: nil)
		button.tintColor = .gray
		return button
	}()
	
	private lazy var addressView: AddressView = {
		let view = AddressView()
		return view
	}()
	
	private lazy var contentView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var promoCollectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		layout.itemSize = CGSize(width: 100, height: 80)
		layout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(PromoCollectionViewCell.self, forCellWithReuseIdentifier: PromoCollectionViewCell.identifirer)
		collectionView.backgroundColor = Constants.backgroundColor
		collectionView.showsHorizontalScrollIndicator = false
		return collectionView
	}()
	
	private lazy var promoBannersCollectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		layout.itemSize = CGSize(width: 290, height: 115)
		layout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.identifirer)
		collectionView.backgroundColor = Constants.backgroundColor
		collectionView.showsHorizontalScrollIndicator = false
		return collectionView
	}()
	
	private lazy var salesCollectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
		layout.itemSize = CGSize(width: 120, height: 210)
		layout.scrollDirection = .horizontal
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: SaleCollectionViewCell.identifirer)
		collectionView.backgroundColor = Constants.backgroundColor
		collectionView.showsHorizontalScrollIndicator = false
		return collectionView
	}()
	
	private lazy var hamburgerMenuButton: UIBarButtonItem = {
		let button = UIBarButtonItem(image: UIImage(named: "hamburger"), style: .plain, target: self, action: #selector(hamburgerMenuButtonAction))
		button.tintColor = Constants.smallTextColor
		return button
	}()
	
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.isUserInteractionEnabled = true
		scrollView.isScrollEnabled = true
		return scrollView
	}()
	
	private lazy var salesLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.headersFont
		label.text = "Акции"
		return label
	}()
	
	private lazy var catalogLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = Constants.headersFont
		label.text = "Каталог"
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
	
	private lazy var catalogCollectionView: UICollectionView = {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
		let height = (view.frame.size.width - 55 ) / 3
		layout.itemSize = CGSize(width: height, height: 140)
		let collectionView = UICollectionView(frame: CGRect(x: 5, y: 5, width: view.frame.width - 10, height: view.frame.height - 10), collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: CatalogCollectionViewCell.identifirer)
		collectionView.backgroundColor = Constants.backgroundColor
		return collectionView
	}()
		
	private var promoCollectionViewDelegate: PromoCollectionViewDelegate?
	private var promoBannersDelegate: PromoBannersCollectionViewDelegate?
	private var salesCollectionViewDelegate: SalesCollectionViewDelegate?
	private var catalogCollectionViewDelegate: CatalogCollectionViewDelegate?

	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter = MainPresenter(view: self)
		self.promoCollectionViewDelegate = PromoCollectionViewDelegate()
		self.promoBannersDelegate = PromoBannersCollectionViewDelegate()
		self.salesCollectionViewDelegate = SalesCollectionViewDelegate()
		self.catalogCollectionViewDelegate = CatalogCollectionViewDelegate()
		
		promoCollectionView.delegate = promoCollectionViewDelegate
		promoCollectionView.dataSource = promoCollectionViewDelegate
		promoBannersCollectionView.delegate = promoBannersDelegate
		promoBannersCollectionView.dataSource = promoBannersDelegate
		salesCollectionView.delegate = salesCollectionViewDelegate
		salesCollectionView.dataSource = salesCollectionViewDelegate
		catalogCollectionView.delegate = catalogCollectionViewDelegate
		catalogCollectionView.dataSource = catalogCollectionViewDelegate
		
		setupSubviews()
	}
	
	// MARK: - MainViewProtocol
	
	func setNewAddress(address: String) {
		addressView.setAddress(address: address)
	}
	
	// MARK: - Private methods
	
	private func setupSubviews() {
		view.backgroundColor = .white
		setupNavigationBar()
		view.addSubview(scrollView)
		setupScrollView()
		
		scrollView.addSubview(contentView)
		setupContentView()
		
		view.layoutSubviews()
		
		contentView.addSubview(promoCollectionView)
		setupPromoCollectionView()
		
		contentView.addSubview(promoBannersCollectionView)
		setupPromoBannersCollectionView()
		
		contentView.addSubview(salesLabel)
		salesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
		salesLabel.topAnchor.constraint(equalTo: promoBannersCollectionView.bottomAnchor, constant: 20).isActive = true
		
		contentView.addSubview(salesButton)
		setupSalesButton()
		
		contentView.addSubview(salesCollectionView)
		setupSalesCollectionView()
		
		contentView.addSubview(catalogLabel)
		catalogLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
		catalogLabel.topAnchor.constraint(equalTo: salesCollectionView.bottomAnchor, constant: 20).isActive = true
		
		contentView.addSubview(catalogCollectionView)
		setupCatalogCollectionView()
		
		scrollView.layoutSubviews()
	}
	
	private func setupCatalogCollectionView() {
		catalogCollectionView.topAnchor.constraint(equalTo: catalogLabel.bottomAnchor, constant: 20).isActive = true
		catalogCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
		catalogCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
		catalogCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
	}
	
	private func setupSalesButton() {
		salesButton.centerYAnchor.constraint(equalTo: salesLabel.centerYAnchor).isActive = true
		salesButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
		salesButton.leadingAnchor.constraint(greaterThanOrEqualTo: salesLabel.trailingAnchor, constant: 5).isActive = true
		salesButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
		salesButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
	}
	
	private func setupContentView() {
		contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
		contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
		contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
		contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
		contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
	}
	
	private func setupScrollView() {
		scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
	
	private func setupPromoCollectionView() {
		promoCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
		promoCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
		promoCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
		promoCollectionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
	}
	
	private func setupPromoBannersCollectionView() {
		promoBannersCollectionView.topAnchor.constraint(equalTo: promoCollectionView.bottomAnchor, constant: 20).isActive = true
		promoBannersCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
		promoBannersCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
		promoBannersCollectionView.heightAnchor.constraint(equalToConstant: 115).isActive = true
	}
	
	private func setupSalesCollectionView() {
		salesCollectionView.topAnchor.constraint(equalTo: salesLabel.bottomAnchor, constant: 20).isActive = true
		salesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
		salesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
		salesCollectionView.heightAnchor.constraint(equalToConstant: 210).isActive = true
	}

	private func setupNavigationBar() {
		let recognizer = UITapGestureRecognizer(target: self, action: #selector(addressButtonAction))
		recognizer.delegate = self
		addressView.addGestureRecognizer(recognizer)
		addressView.configurate()
		let adressBarButtonItem = UIBarButtonItem(customView: addressView)
		
		navigationController?.navigationBar.backgroundColor = Constants.backgroundColor
		
		navigationItem.leftBarButtonItems = [hamburgerMenuButton, adressBarButtonItem]
		navigationItem.rightBarButtonItem = favoritesButton
		
		let searchController = UISearchController()
		searchController.searchBar.showsBookmarkButton = true
		searchController.searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .bookmark, state: .normal)
		searchController.searchBar.searchTextField.leftView = nil
		searchController.searchBar.searchTextField.placeholder = "Поиск товаров"
		
		navigationItem.searchController = searchController
	}
	
	// MARK: - @objc private methods
	
	let transition = MenuTransition()
	
	@objc private func hamburgerMenuButtonAction() {
		let vc = MenuViewController()
		vc.modalPresentationStyle = .custom
		vc.transitioningDelegate = transition
		
		self.present(vc, animated: true, completion: nil)
	}
	
	@objc private func addressButtonAction() {
		let addressesViewController = AddressesViewController()
		self.present(addressesViewController, animated: true, completion: nil)
	}
}
