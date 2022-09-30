import Foundation
import UIKit

class PresentationController: UIPresentationController {
	
	override var frameOfPresentedViewInContainerView: CGRect {
		let bounds = containerView!.bounds
		return CGRect(x: 0, y: 0, width: bounds.width * 4 / 5, height: bounds.height)
	}
	
	override func presentationTransitionWillBegin() {
		super.presentationTransitionWillBegin()
		containerView?.addSubview(presentedView!)
	}
	
	override func containerViewDidLayoutSubviews() {
		super.containerViewDidLayoutSubviews()
		presentedView?.frame = frameOfPresentedViewInContainerView
	}
}
