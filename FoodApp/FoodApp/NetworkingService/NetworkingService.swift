import Foundation

final class NetworkingService: NetworkingServiceProtocol {
	
	// MARK: - Properties
	
	private let configuration: URLSessionConfiguration = .default
	private lazy var urlSession: URLSession = .init(configuration: configuration)
	static let url = URL(string: "https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address")!
	
	// MARK: - NetworkingServiceProtocol
		
	public func fetchData(query: String, completion: @escaping (Result<Data, Error>) -> Void) {
		
		guard let request = createRequest(query: query) else {
			completion(.failure(NetworkingError.urlError))
			return
		}
		
		let dataTask = urlSession.dataTask(with: request) {data, response, error in
			guard (response as? HTTPURLResponse)?.statusCode == 200,
				let data = data,
				error == nil
			else {
				completion(.failure(NetworkingError.fetchError))
				return
			}
			completion(.success(data))
		}
		dataTask.resume()
	}
	
	private func createRequest(query: String) -> URLRequest? {
		var request = URLRequest(url: NetworkingService.url)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.setValue("Token f59b487d8c9929a56943e158a33175bfc3ad0eb5", forHTTPHeaderField: "Authorization")
		
		let params: [String: String] = [
			"query": query
		]
		
		let encoder = JSONEncoder()
		var data: Data?
		do {
			data = try encoder.encode(params)
		} catch {
			return nil
		}
		
		request.httpBody = data
		return request
	}
}
