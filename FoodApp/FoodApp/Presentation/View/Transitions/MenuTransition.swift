import Foundation
import UIKit

final class MenuTransition: NSObject, UIViewControllerTransitioningDelegate {
	
	private let driver = TransitionDriver()
	
	func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
		let presentationController = DimmPresentationController(presentedViewController: presented, presenting: presenting ?? source)
		driver.link(to: presented)
		return presentationController
	}
	
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return PresentAnimation()
	}
	
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return DismissAnimation()
	}
	
	func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
		return driver
	}
}
