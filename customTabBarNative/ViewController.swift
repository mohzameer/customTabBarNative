//
//  ViewController.swift
//  customTabBarNative
//
//  Created by Mohammed Zameer on 12/23/17.
//  Copyright © 2017 Mohammed Zameer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITabBarDelegate {

    var viewControllerOne: UIViewController!
    var viewControllerTwo: UIViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerOne = storyboard?.instantiateViewController(withIdentifier: "vone")
        viewControllerTwo = storyboard?.instantiateViewController(withIdentifier: "vtwo")
        
        viewControllers = [viewControllerOne,viewControllerTwo]
        tabBar.delegate=self
        tabBar.selectedItem = tabBar.items![0] as UITabBarItem
        loadAVC(0)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        
            selectedIndex = item.tag
        

            let previousIndex = selectedIndex
            
            let previousVC = viewControllers[previousIndex]
            
            previousVC.willMove(toParentViewController: nil)
            previousVC.view.removeFromSuperview()
            previousVC.removeFromParentViewController()
            loadAVC(selectedIndex)
        
        
    }
    
    func loadAVC(_ selIndex:Int){
        let vc = viewControllers[selIndex]
        addChildViewController(vc)
        vc.view.frame = containerView.bounds
        containerView.addSubview(vc.view)
        
        vc.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

