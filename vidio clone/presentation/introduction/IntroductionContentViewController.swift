//
//  IntroductionContentViewController.swift
//  vidio clone
//
//  Created by Yudha Setyaji on 2022/3/31.
//

import UIKit

class IntroductionContentViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentImage: UIImageView!
    
    var image: String?
    var descriptionText: String?
    var titleText: String?
    
    init(
        title: String,
        description: String,
        image: String
    ) {
        self.titleText = title
        self.descriptionText = description
        self.image = image
        super.init(nibName: "IntroductionContentViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setData()
    }
    
    private func setData() {
        titleLabel.text = self.titleText
        descriptionLabel.text = self.descriptionText
        contentImage.image = UIImage(named: self.image ?? "")
    }

}
