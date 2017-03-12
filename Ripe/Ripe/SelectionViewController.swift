//
//  SelectionViewController.swift
//  Ripe
//
//  Created by William on 2017-03-11.
//  Copyright © 2017 Matthew Paletta. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    var selectionPageViewController: SelectionPageViewController? {
        didSet {
            selectionPageViewController?.selectionDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: #selector(SelectionViewController.didChangePageControlValue), for: .valueChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let selectionPageViewController = segue.destination as? SelectionPageViewController {
            self.selectionPageViewController = selectionPageViewController
        }
    }
    
    @IBAction func didTapNextButton(_ sender: UIButton) {
        selectionPageViewController?.scrollToNextViewController()
    }
    
    func didChangePageControlValue() {
        selectionPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
    
}

extension SelectionViewController: SelectionPageViewControllerDelegate {
    
    func selectionPageViewController(_ selectionPageViewController: SelectionPageViewController, didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func selectionPageViewController(_ selectionPageViewController: SelectionPageViewController, didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
