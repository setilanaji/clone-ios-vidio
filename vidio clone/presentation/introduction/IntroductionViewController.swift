//
//  IntroductionViewController.swift
//  vidio clone
//
//  Created by Yudha Setyaji on 2022/3/31.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    @IBOutlet weak var viewContainer: UIView!
    
    var pageController: IntroductionPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageController = IntroductionPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        addChild(pageController)
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.addSubview(pageController.view)
        
        NSLayoutConstraint.activate([
            pageController.view.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 0.0),
            pageController.view.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: 0.0),
            pageController.view.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 0.0),
            pageController.view.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: 0.0),
        ])
        
        pageController.didMove(toParent: self)
        
    }
    
    
    
}
