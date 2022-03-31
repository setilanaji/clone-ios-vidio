//
//  IntroductionViewController.swift
//  vidio clone
//
//  Created by Yudha Setyaji on 2022/3/31.
//

import UIKit

class IntroductionPageViewController: UIPageViewController {
    
    private var initialPage = 0
    private var pages = [UIViewController]()
    
    lazy var pageControll: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .systemGray2
        return pageControl
    }()
    
    lazy var activeImage: UIImage = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 21, height: 7)))
        view.backgroundColor = .red
        view.alpha = 1
        view.isOpaque = false
        view.layer.cornerRadius = 4
        view.setNeedsDisplay()
        view.layoutIfNeeded()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view.asImage()
    }()
    
    lazy var inactiveImage: UIImage = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 7, height: 7)))
        view.backgroundColor = .systemGray2
        view.alpha = 0.5
        view.layer.cornerRadius = 4
        view.isOpaque = false
        view.setNeedsDisplay()
        view.layoutIfNeeded()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view.asImage()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setPageControll()
        layout()
    }
    
    private func setup() {
        dataSource = self
        delegate = self
        
        pageControll.addTarget(self, action: #selector(pageControllTapped(_:)), for: .valueChanged)
        
        let views = [
            IntroductionContentViewController(title: "TV, Sinetron, Olahraga, & Drakor, Semuanya Ada", description: "Pilih dari 40+ TV channel dan ratusan ribu konten gratis untuk mengisi waktu senggangmu, apapu minat kamu", image: "intro-1"),
            IntroductionContentViewController(title: "Nikmati konten ekklusif tanpa iklan dengan premier!", description: "Dengan Premier, kamu bisa nonton tanpa iklan dan mengakses berbagai konten eksklusif dengan harga terjangkau.", image: "intro-1"),
            IntroductionContentViewController(title: "Nonton kapan saja dan dimana saja dengan fitur unduhan!", description: "Tonton tanpa koneksi di ponselmu dengan fitur Unduhan. Vidio bisa juga digunakan di desktop atau TV kamu", image: "intro-1"),
            IntroductionContentViewController(title: "Main dapat hadiah & ngobrol sama yang lain. Makin seru!", description: "Main Kuis, Polling dan Voting atau ngobrol sama penonton lain sambil nonton kesukaanmu", image: "intro-1"),
        ]
        
        pages.append(contentsOf: views)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    private func setPageControll() {
        
        pageControll.numberOfPages = pages.count
        pageControll.preferredIndicatorImage = inactiveImage
        pageControll.currentPage = initialPage
        pageControll.setIndicatorImage(activeImage, forPage: initialPage)
    }
    
    private func layout() {
        view.addSubview(pageControll)
        
        NSLayoutConstraint.activate([
            pageControll.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControll.heightAnchor.constraint(equalToConstant: 20),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControll.bottomAnchor, multiplier: 1),
        ])
    }
    
}

extension IntroductionPageViewController {
    @objc func pageControllTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}


extension IntroductionPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControll.currentPage = currentIndex
        pageControll.setIndicatorImage(activeImage, forPage: currentIndex)
        guard let prevIndex = pages.firstIndex(of: previousViewControllers[0]), completed, finished else { return }
        pageControll.setIndicatorImage(inactiveImage, forPage: prevIndex)
    }
}

extension IntroductionPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return nil
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return nil
        }
    }
    
    
}


