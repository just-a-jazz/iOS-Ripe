//
//  SelectionPageViewController.swift
//  Ripe
//
//  Created by William on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit

class SelectionPageViewController: UIPageViewController {
    
    weak var selectionDelegate: SelectionPageViewControllerDelegate?
    
    fileprivate(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newSelectedViewController("CartTableNavigation"),
                self.newSelectedViewController("ProductListNavigation")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if let initialViewController = orderedViewControllers.first {
            scrollToViewController(initialViewController)
        }
        
        selectionDelegate?.selectionPageViewController(self, didUpdatePageCount: orderedViewControllers.count)
    }

    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self, viewControllerAfter: visibleViewController) {
                scrollToViewController(nextViewController)
        }
    }
    
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.index(of: firstViewController) {
                let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .forward : .reverse
                let nextViewController = orderedViewControllers[newIndex]
                scrollToViewController(nextViewController, direction: direction)
        }
    }
    
    fileprivate func newSelectedViewController(_ name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(name)")
    }
    

    fileprivate func scrollToViewController(_ viewController: UIViewController, direction: UIPageViewControllerNavigationDirection = .forward) {
        setViewControllers([viewController], direction: direction, animated: true, completion: { (finished) -> Void in
            self.notifySelectionDelegateOfNewIndex()
        })
    }
    

    fileprivate func notifySelectionDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
                selectionDelegate?.selectionPageViewController(self, didUpdatePageIndex: index)
        }
    }
    
}

// MARK: UIPageViewControllerDataSource

extension SelectionPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
}

extension SelectionPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        notifySelectionDelegateOfNewIndex()
    }
    
}

protocol SelectionPageViewControllerDelegate: class {
    
    func selectionPageViewController(_ selectionPageViewController: SelectionPageViewController, didUpdatePageCount count: Int)
    
    func selectionPageViewController(_ selectionPageViewController: SelectionPageViewController, didUpdatePageIndex index: Int)
    
}


