//
//  PageVC.swift
//  weInternet
//
//  Created by ahmed.fouadgomaa on 8/6/19.
//  Copyright © 2019 ahmedfouad. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var pageControl = UIPageControl()
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVC(viewController: "Landing1VC"),
                self.newVC(viewController: "Landing2VC")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        self.view.backgroundColor = .white
        
        if let firstVC = orderedViewControllers.first{setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)}
        
        configurePageControl()
        
        
        
        
        self.dataSource = self
        if let secondViewController = orderedViewControllers[0] as? Landing1VC {
            self.setViewControllers([secondViewController], direction: .forward, animated: false, completion: nil)
            secondViewController.btnNext.addTarget(self, action: #selector(addData(_:)), for: .touchUpInside)
        }
    }
    
    @IBAction func addData(_ sender: Any) {
        if let thirdViewController = orderedViewControllers.last {
            self.setViewControllers([thirdViewController], direction: .forward, animated: false, completion: nil)
            pageControl.currentPage = 1
        }
    }
    
    func newVC (viewController: String) -> UIViewController{
        return UIStoryboard(name: "Landing", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func configurePageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY-(UIScreen.main.bounds.maxY*(35/100)), width: UIScreen.main.bounds.width, height: 50))
        
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.isUserInteractionEnabled = false
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.6784313725, green: 0.1450980392, blue: 0.5137254902, alpha: 0.3400000036)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.4352941176, green: 0.1333333333, blue: 0.5098039216, alpha: 1)
//        pageControl.pageIndicatorTintColor = UIColor.init(named: "PageControlDot")
//        pageControl.currentPageIndicatorTintColor = UIColor.init(named: "PageControlDotSelected")
        self.view.addSubview(pageControl)
    }
    
}

extension PageVC{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {
//            return orderedViewControllers.last
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        guard orderedViewControllers.count != nextIndex else {
//            return orderedViewControllers.first
            return nil
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentVC = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentVC)!
    }
}
