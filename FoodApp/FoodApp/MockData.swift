//
//  MockData.swift
//  FoodApp
//
//  Created by ayaz on 30.09.2022.
//

import Foundation
import UIKit

struct Promo {
	
	let image: UIImage
	let name: String
}

struct Banner {
	let image: UIImage
}

struct Sale {
	
	let image: UIImage
	let name: String
	let sale: String
	let price: String
	let oldPrice: String
	let weight: String
}

struct Catalog {
	
	let image: UIImage
	let name: String
	let color: UIColor
}

final class MockData {
	
	static let promo: [Promo] = [
	 Promo(image: UIImage(named: "promo0")!, name: "Летний обед"),
	 Promo(image: UIImage(named: "promo1")!, name: "Летний пикник"),
	 Promo(image: UIImage(named: "promo2")!, name: "На зактрак"),
	 Promo(image: UIImage(named: "promo3")!, name: "На ужин"),
	 Promo(image: UIImage(named: "promo0")!, name: "На обед"),
	 Promo(image: UIImage(named: "promo1")!, name: "Летний пикник"),
	 Promo(image: UIImage(named: "promo2")!, name: "Летний обед"),
 ]

	static let banners: [Banner] = [
	Banner(image: UIImage(named: "banner")!),
	Banner(image: UIImage(named: "banner")!),
	Banner(image: UIImage(named: "banner")!),
	Banner(image: UIImage(named: "banner")!),
	Banner(image: UIImage(named: "banner")!),
	Banner(image: UIImage(named: "banner")!),
	Banner(image: UIImage(named: "banner")!),
 ]

 static let sales: [Sale] = [
	 Sale(image: UIImage(named: "sale0")!, name: "Черные спагетти с морепродуктам (большая порция)", sale: "35", price: "500", oldPrice: "1000", weight: "400"),
	 Sale(image: UIImage(named: "sale1")!, name: "Казаречче с индейкой и томатами ", sale: "35", price: "500", oldPrice: "1000", weight: "400"),
	 Sale(image: UIImage(named: "sale2")!, name: "Равиоли с грибами", sale: "35", price: "500", oldPrice: "1000", weight: "400"),
	 Sale(image: UIImage(named: "sale0")!, name: "Паста", sale: "35", price: "500", oldPrice: "1000", weight: "400"),
	 Sale(image: UIImage(named: "sale1")!, name: "Паста", sale: "35", price: "500", oldPrice: "1000", weight: "400"),
	 Sale(image: UIImage(named: "sale2")!, name: "Паста", sale: "35", price: "500", oldPrice: "1000", weight: "400"),
	 Sale(image: UIImage(named: "sale0")!, name: "Паста", sale: "35", price: "500", oldPrice: "1000", weight: "400"),
 ]

	static let catalog: [Catalog] = [
		Catalog(image: UIImage(named: "catalog0")!, name: "Пицца", color: #colorLiteral(red: 0.9819388986, green: 0.881049335, blue: 0.6764041185, alpha: 1)),
		Catalog(image: UIImage(named: "catalog1")!, name: "Наборы", color: #colorLiteral(red: 0.9594486356, green: 0.7542556524, blue: 0.7112396359, alpha: 1)),
		Catalog(image: UIImage(named: "catalog2")!, name: "Паста", color: #colorLiteral(red: 0.7307267189, green: 0.7209545374, blue: 0.5716820359, alpha: 1)),
		Catalog(image: UIImage(named: "catalog3")!, name: "Ризотто", color: #colorLiteral(red: 0.7683117986, green: 0.8264796138, blue: 0.807038188, alpha: 1)),
		Catalog(image: UIImage(named: "catalog4")!, name: "Салаты", color: #colorLiteral(red: 0.7239583135, green: 0.7672206759, blue: 0.7844961882, alpha: 1)),
		Catalog(image: UIImage(named: "catalog5")!, name: "Полу фабрикаты", color: #colorLiteral(red: 0.640263021, green: 0.683183074, blue: 0.616721034, alpha: 1)),
		Catalog(image: UIImage(named: "catalog6")!, name: "Десерты", color: #colorLiteral(red: 0.985067904, green: 0.9002349973, blue: 0.711458087, alpha: 1)),
		Catalog(image: UIImage(named: "catalog7")!, name: "Добавки к блюдам", color: #colorLiteral(red: 0.8261090517, green: 0.7686333656, blue: 0.7675775886, alpha: 1)),
		Catalog(image: UIImage(named: "catalog8")!, name: "Напитки", color: #colorLiteral(red: 0.9723750949, green: 0.8284062743, blue: 0.675555706, alpha: 1)),
	]

}
