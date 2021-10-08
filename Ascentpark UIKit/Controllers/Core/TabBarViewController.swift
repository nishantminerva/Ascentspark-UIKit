//
//  TabBarViewController.swift
//  Ascentpark UIKit
//
//  Created by Nishant Kumar on 08/10/21.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.delegate = self
        self.selectedIndex = 1
        

        // Do any additional setup after loading the view.
        
        let vc1 = HomeViewController()
        let vc2 = SearchViewController()
        let vc3 = WelcomViewController()

        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always

        vc1.title = "Browse"
        vc2.title = "Search"
        vc3.title = "Welcome"

        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)

        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Radio", image: UIImage(systemName: "dot.radiowaves.left.and.right"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "globe"), tag: 3)

        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true

        setViewControllers([nav1, nav2, nav3], animated: false)
        
    }
        
    
        
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
