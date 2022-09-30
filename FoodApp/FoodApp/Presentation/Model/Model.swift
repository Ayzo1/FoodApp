//
//  Model.swift
//  FoodApp
//
//  Created by ayaz on 29.09.2022.
//

import Foundation

final class Model: ModelProtocol {
	
	var currentAddress = Address(value: "Пушкинская, 100") 
	var recieveNewAddress: ((Address) -> Void)?
	
	func setNewAddress(address: Address) {
		currentAddress = address
		recieveNewAddress?(address)
	}
}
