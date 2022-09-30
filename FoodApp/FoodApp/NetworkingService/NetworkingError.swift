import Foundation

enum NetworkingError: Error {
	case parseError
	case urlError
	case fetchError
}

extension NetworkingError {
	public var description: String {
		switch self {
		case .urlError:
			return "bad url"
		case .parseError:
			return "could not parse"
		case .fetchError:
			return "failed to load data from API"
		}
	}
}
