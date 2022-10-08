import UIKit

class MainViewController: UIViewController, MainViewProtocol {
	
	// MARK: - Private properties
		
	private var presenter: MainPresenterProtocol?
	private let transition = MenuTransition()
	private let searchController = UISearchController()
	
	private var favoritesButton: UIButton = {
		let button = UIButton()
		button.tintColor = .gray
		button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = Constants.secondBackgroundColor
		return button
	}()
	
	private lazy var addressView: AddressView = {
		let view = AddressView()
		return view
	}()
	
	private lazy var hamburgerMenuButton: UIBarButtonItem = {
		let button = UIBarButtonItem(image: UIImage(named: "hamburger"), style: .plain, target: self, action: #selector(hamburgerMenuButtonAction))
		button.tintColor = Constants.smallTextColor
		return button
	}()
	
	private lazy var collectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: createLayout())
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(PromoCollectionViewCell.self, forCellWithReuseIdentifier: PromoCollectionViewCell.identifirer)
		collectionView.register(BannerCollectionViewCell.self.self, forCellWithReuseIdentifier: BannerCollectionViewCell.identifirer)
		collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: SaleCollectionViewCell.identifirer)
		collectionView.register(CatalogCollectionViewCell.self, forCellWithReuseIdentifier: CatalogCollectionViewCell.identifirer)
		collectionView.register(SalesHeaderView.self, forSupplementaryViewOfKind: "Sales", withReuseIdentifier: SalesHeaderView.identifirer)
		collectionView.register(CatalogHeaderView.self, forSupplementaryViewOfKind: "Catalog", withReuseIdentifier: CatalogHeaderView.identifirer)
		collectionView.backgroundColor = Constants.backgroundColor
		return collectionView
	}()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter = MainPresenter(view: self)
		collectionView.delegate = self
		collectionView.dataSource = self
		view.backgroundColor = Constants.backgroundColor
		setupNavigationBar()
		view.addSubview(collectionView)
		collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
	}
	
	// MARK: - MainViewProtocol
	
	func setNewAddress(address: String) {
		addressView.setAddress(address: address)
	}
	
	// MARK: - Private methods
	
	private func setupNavigationBar() {
		let recognizer = UITapGestureRecognizer(target: self, action: #selector(addressButtonAction))
		addressView.addGestureRecognizer(recognizer)
		addressView.configurate()
		let adressBarButtonItem = UIBarButtonItem(customView: addressView)
		navigationController?.navigationBar.backgroundColor = Constants.backgroundColor
		navigationItem.leftBarButtonItems = [hamburgerMenuButton, adressBarButtonItem]
		searchController.delegate = self
		searchController.searchBar.showsBookmarkButton = true
		searchController.searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .bookmark, state: .normal)
		setupSearchBar()
		searchController.searchBar.searchTextField.leftView = nil
		searchController.searchBar.searchTextField.placeholder = "Поиск товаров"
		navigationItem.searchController = searchController
	}
	
	private func setupSearchBar() {
		searchController.searchBar.searchTextField.translatesAutoresizingMaskIntoConstraints = false
		searchController.searchBar.searchTextField.centerYAnchor.constraint(equalTo: searchController.searchBar.centerYAnchor, constant: 0).isActive = true
		searchController.searchBar.searchTextField.leadingAnchor.constraint(equalTo: searchController.searchBar.leadingAnchor, constant: 20).isActive = true
		searchController.searchBar.searchTextField.widthAnchor.constraint(equalTo: searchController.searchBar.widthAnchor, multiplier: 3/4).isActive = true
		
		searchController.searchBar.addSubview(favoritesButton)
		favoritesButton.centerYAnchor.constraint(equalTo: searchController.searchBar.centerYAnchor).isActive = true
		favoritesButton.trailingAnchor.constraint(equalTo: searchController.searchBar.trailingAnchor, constant: -25).isActive = true
		favoritesButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
		favoritesButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
		favoritesButton.layer.cornerRadius = 15
	}

	private func createLayout() -> UICollectionViewCompositionalLayout {
		let layout = UICollectionViewCompositionalLayout { [weak self] (section, layoutEnvironment) -> NSCollectionLayoutSection? in
			var result: NSCollectionLayoutSection?
			switch section {
			case 0:
				result = self?.createPromoSectionLayout()
			case 1:
				result = self?.createBannersSectionLayout()
			case 2:
				result = self?.createSalesSectionLayout()
			case 3:
				result = self?.createCatalogSectionLayout()
			default:
				break
			}
			return result
		}
		return layout
	}
	
	private func createPromoSectionLayout() -> NSCollectionLayoutSection {
		let itemSize = NSCollectionLayoutSize( widthDimension: .absolute(100), heightDimension: .absolute(90))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		item.contentInsets = .init(top: 2, leading: 5, bottom: 2, trailing: 5)
		let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(90))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
		let section = NSCollectionLayoutSection(group: group)
		section.contentInsets = .init(top: 10, leading: 15, bottom: 10, trailing: 15)
		section.orthogonalScrollingBehavior = .continuous
		return section
	}
	
	private func createBannersSectionLayout() -> NSCollectionLayoutSection {
		let itemSize = NSCollectionLayoutSize( widthDimension: .absolute(290), heightDimension: .absolute(115))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		item.contentInsets = .init(top: 2, leading: 5, bottom: 5, trailing: 2)
		let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(290), heightDimension: .absolute(120))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
		let section = NSCollectionLayoutSection(group: group)
		section.contentInsets = .init(top: 10, leading: 15, bottom: 10, trailing: 15)
		section.orthogonalScrollingBehavior = .continuous
		return section
	}
	
	private func createSalesSectionLayout() -> NSCollectionLayoutSection {
		let itemSize = NSCollectionLayoutSize( widthDimension: .absolute(120), heightDimension: .absolute(210))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		item.contentInsets = .init(top: 2, leading: 5, bottom: 2, trailing: 5)
		let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(120), heightDimension: .absolute(220))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
		let section = NSCollectionLayoutSection(group: group)
		section.contentInsets = .init(top: 10, leading: 15, bottom: 10, trailing: 15)
		section.orthogonalScrollingBehavior = .continuous
		let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40)), elementKind: "Sales", alignment: .top)
		section.boundarySupplementaryItems = [header]
		return section
	}
	
	private func createCatalogSectionLayout() -> NSCollectionLayoutSection {
		let itemSize = NSCollectionLayoutSize( widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)
		item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150))
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
		let section = NSCollectionLayoutSection(group: group)
		section.contentInsets = .init(top: 10, leading: 15, bottom: 10, trailing: 15)
		section.orthogonalScrollingBehavior = .none
		let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40)), elementKind: "Catalog", alignment: .top)
		section.boundarySupplementaryItems = [header]
		return section
	}
	
	// MARK: - @objc private methods
	
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

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return presenter?.getBlocksCount() ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		switch section {
		case 0:
			return presenter?.getItemsCount(blockIndex: 0) ?? 0
		case 1:
			return presenter?.getItemsCount(blockIndex: 1) ?? 0
		case 2:
			return presenter?.getItemsCount(blockIndex: 2) ?? 0
		case 3:
			return presenter?.getItemsCount(blockIndex: 3) ?? 0
		default:
			return 0
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch indexPath.section {
		case 0:
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionViewCell.identifirer, for: indexPath) as? PromoCollectionViewCell else {
				return UICollectionViewCell()
			}
			guard let promo = presenter?.getPromoItem(index: indexPath.row) else {
				return cell
			}
			cell.setData(image: promo.image, text: promo.name)
			return cell
		case 1:
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.identifirer, for: indexPath) as? BannerCollectionViewCell else {
				return UICollectionViewCell()
			}
			guard let banner = presenter?.getBannerItem(index: indexPath.row) else {
				return cell
			}
			cell.setImage(image: banner.image)
			return cell
		case 2:
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCollectionViewCell.identifirer, for: indexPath) as? SaleCollectionViewCell else {
				return UICollectionViewCell()
			}
			guard let sale = presenter?.getSaleItem(index: indexPath.row) else {
				return cell
			}
			cell.setData(name: sale.name, image: sale.image, price: sale.price, oldPrice: sale.oldPrice, sale: sale.sale, weight: sale.weight)
			return cell
		case 3:
			guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCollectionViewCell.identifirer, for: indexPath) as? CatalogCollectionViewCell else {
				return UICollectionViewCell()
			}
			guard let catalog = presenter?.getCatalogItem(index: indexPath.row) else {
				return cell
			}
			cell.setData(image: catalog.image, text: catalog.name)
			cell.backgroundColor = catalog.color
			cell.layer.cornerRadius = 15
			return cell
		default:
		   return UICollectionViewCell()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch indexPath.section {
		case 2:
			let view = collectionView.dequeueReusableSupplementaryView(ofKind: "Sales", withReuseIdentifier: SalesHeaderView.identifirer, for: indexPath) as? SalesHeaderView
			return view ?? UICollectionReusableView()
		case 3:
			let view = collectionView.dequeueReusableSupplementaryView(ofKind: "Catalog", withReuseIdentifier: CatalogHeaderView.identifirer, for: indexPath) as? CatalogHeaderView
			return view ?? UICollectionReusableView()
		default:
			return UICollectionReusableView()
		}
	}
}

extension MainViewController: UISearchControllerDelegate {
	
	func didPresentSearchController(_ searchController: UISearchController) {
		favoritesButton.isHidden = true
	}
	
	func didDismissSearchController(_ searchController: UISearchController) {
		favoritesButton.isHidden = false
	}
}
