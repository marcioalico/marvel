//
//  AnimationHandler.swift
//  Marvel
//
//  Created by Marcio Alico on 1/5/22.
//

import Foundation
import UIKit
import Lottie

class MarvelAnimationViewController: UIViewController, MarvelViewController {
    
    var router: MarvelRouter = MarvelAnimationRouter()
    var viewModel: MarvelViewModel = MarvelAnimationViewModel()
    
    let animationView =  AnimationView()
    let kMarvelAnimation = "15368-iron-man"
    
    @IBOutlet weak var animationUIView: UIView!
    @IBOutlet weak var animationUIVIewHeight: NSLayoutConstraint!
    @IBOutlet weak var animationUIViewWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
    }
    
    func startAnimation() {
        let marvelAnimation = Animation.named(kMarvelAnimation)
        animationView.animation = marvelAnimation
        animationView.frame = UIScreen.main.bounds
        
        animationUIVIewHeight.constant = UIScreen.main.bounds.height
        animationUIViewWidth.constant = UIScreen.main.bounds.width
        
        animationView.contentMode = .center
        animationView.contentMode = .scaleAspectFill
        
        animationView.layer.masksToBounds = true
        
        animationView.loopMode = .autoReverse
        animationView.animationSpeed = 1.2
        animationView.play()
        self.animationUIView.addSubview(animationView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            self.navigateToHome()
        }
    }
    
    func navigateToHome() {
        guard let homeViewController = HomeRouter().viewController else { return }
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(homeViewController, animated: false)
    }
}
