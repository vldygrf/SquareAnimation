//
//  ViewController.swift
//  SquareAnimation
//
//  Created by Vladislav Garifulin on 27.02.2021.
//

import UIKit

class AnimationViewController: UIViewController {
    private enum Settings {
        static let squareSize: CGFloat = 100
        static let squareSizeMultiplier: CGFloat = 2.0
        static let animationDuration: TimeInterval = 3.0
        static let animationCurve: UIView.AnimationCurve = .easeInOut
    }
    
    override func loadView() {
        view = AnimationView()
    }
    
    func view() -> AnimationView {
        return view as! AnimationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view().squareSize = Settings.squareSize
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view().squareSize *= Settings.squareSizeMultiplier
        let animator = UIViewPropertyAnimator(duration: Settings.animationDuration, curve: Settings.animationCurve, animations: {
            self.view().layoutIfNeeded()
        })
        animator.startAnimation()
    }
}

