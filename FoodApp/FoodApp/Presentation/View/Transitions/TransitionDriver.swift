import Foundation
import UIKit

class TransitionDriver: UIPercentDrivenInteractiveTransition {

	private weak var presentedController: UIViewController?
	private var panRecognizer: UIPanGestureRecognizer?
	
	var maxTranslation: CGFloat {
		return presentedController?.view.frame.width ?? 0
	}
	
	private var isRunning: Bool {
		return percentComplete != 0
	}

	override var wantsInteractiveStart: Bool {
		get {
			let gestureIsActive = panRecognizer?.state == .began
			return gestureIsActive
		}
		set { }
	}
	
	func link(to controller: UIViewController) {
		presentedController = controller
		panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handle(recognizer:)))
		presentedController?.view.addGestureRecognizer(panRecognizer!)
	}
	
	@objc private func handle(recognizer r: UIPanGestureRecognizer) {
		switch r.state {
		case .began:
			pause()
			if !isRunning {
				presentedController?.dismiss(animated: true)
			}
		case .changed:
			update(percentComplete + r.incrementToBottom(maxTranslation: maxTranslation))

		case .ended, .cancelled:
			if r.isProjectedToLeftHalf(maxTranslation: maxTranslation) {
				finish()
			} else {
				cancel()
			}
		case .failed:
			cancel()
		default:
			break
		}
	}
}

private extension UIPanGestureRecognizer {
	func incrementToBottom(maxTranslation: CGFloat) -> CGFloat {
		let translation = self.translation(in: view).x * -1
		setTranslation(.zero, in: nil)

		let percentIncrement = translation / maxTranslation
		return percentIncrement
	}
}

private extension UIPanGestureRecognizer {
	
	func isProjectedToLeftHalf(maxTranslation: CGFloat) -> Bool {
		let endLocation = projectedLocation(decelerationRate: .fast)
		let isPresentationCompleted = endLocation.x > maxTranslation / 4

		return isPresentationCompleted
	}

	func projectedLocation(decelerationRate: UIScrollView.DecelerationRate) -> CGPoint {
		let velocityOffset = velocity(in: view).projectedOffset(decelerationRate: .normal)
		let projectedLocation = location(in: view!) + velocityOffset
		return projectedLocation
	}
}

extension CGPoint {
	func projectedOffset(decelerationRate: UIScrollView.DecelerationRate) -> CGPoint {
		return CGPoint(x: x.projectedOffset(decelerationRate: decelerationRate),
					  y: y.projectedOffset(decelerationRate: decelerationRate))
	}
}

extension CGFloat {
	func projectedOffset(decelerationRate: UIScrollView.DecelerationRate) -> CGFloat {
		let multiplier = 1 / (1 - decelerationRate.rawValue) / 1000
		return self * multiplier
	}
}

extension CGPoint {
	static func +(left: CGPoint, right: CGPoint) -> CGPoint {
		return CGPoint(x: left.x + right.x,
					  y: left.y + right.y)
	}
}
