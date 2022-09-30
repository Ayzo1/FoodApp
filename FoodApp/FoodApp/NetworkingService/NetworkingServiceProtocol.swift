//
//  NetworkingServiceProtocol.swift
//  FoodApp
//
//  Created by ayaz on 29.09.2022.
//

import Foundation

protocol NetworkingServiceProtocol {
	func fetchData(query: String, completion: @escaping (Result<Data, Error>) -> Void)
}
