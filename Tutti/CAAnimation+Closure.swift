//
//  CAAnimation+Closure.swift
//  Tutti
//
//  Created by Pavle Mijatovic on 8/26/18.
//  Copyright © 2018 Pavle Mijatovic. All rights reserved.
//

import QuartzCore

class CAAnimationHandler: NSObject, CAAnimationDelegate {
    var start: (() -> Void)?
    var completion: ((Bool) -> Void)?
    
    private var startTime: Date!
    private var animationDuration: TimeInterval!
    private var animatingTimer: Timer!
    
    var animating: ((CGFloat) -> Void)? {
        willSet {
            if animatingTimer == nil {
                animatingTimer = Timer(timeInterval: 0, target: self, selector: #selector(CAAnimationHandler.animationIsAnimating(_:)), userInfo: nil, repeats: true)
            }
        }
    }
	
    func animationDidStart(_ theAnimation: CAAnimation) {
        start?()
        if animating != nil {
            animationDuration = theAnimation.duration
            startTime = Date()
            RunLoop.current.add(animatingTimer, forMode: RunLoopMode.defaultRunLoopMode)
        }
    }
	
    func animationDidStop(_ theAnimation: CAAnimation, finished: Bool) {
        completion?(finished)
        animatingTimer?.invalidate()
    }
	
    @objc func animationIsAnimating(_ timer: Timer) {
        let progress = CGFloat(Date().timeIntervalSince(startTime) / animationDuration)
        if progress <= 1.0 {
            animating?(progress)
        }
    }
}

public extension CAAnimation {

    public var start: (() -> Void)? {
        set {
			if let animationDelegate = delegate as? CAAnimationHandler {
				animationDelegate.start = newValue
			} else {
				let animationDelegate = CAAnimationHandler()
				animationDelegate.start = newValue
				delegate = animationDelegate
			}
        }
        
        get {
			if let animationDelegate = delegate as? CAAnimationHandler {
				return animationDelegate.start
			}
			
			return nil
        }
    }
    
    public var completion: ((Bool) -> Void)? {
        set {
			if let animationDelegate = delegate as? CAAnimationHandler {
				animationDelegate.completion = newValue
			} else {
				let animationDelegate = CAAnimationHandler()
				animationDelegate.completion = newValue
				delegate = animationDelegate
			}
        }
        get {
			if let animationDelegate = delegate as? CAAnimationHandler {
				return animationDelegate.completion
			}
			return nil
        }
    }
    
    public var animating: ((CGFloat) -> Void)? {
        set {
			if let animationDelegate = delegate as? CAAnimationHandler {
				animationDelegate.animating = newValue
			} else {
				let animationDelegate = CAAnimationHandler()
				animationDelegate.animating = newValue
				delegate = animationDelegate
			}
        }
        get {
			if let animationDelegate = delegate as? CAAnimationHandler {
				return animationDelegate.animating
			}
			return nil
        }
    }
	
	public var progress: ((CGFloat) -> Void)? {
		set {
			animating = newValue
		}
		get {
			return animating
		}
	}
}

public extension CALayer {
	func add(_ anim: CAAnimation, forKey key: String?, withCompletion completion: ((Bool) -> Void)?) {
		anim.completion = completion
		add(anim, forKey: key)
	}
}
