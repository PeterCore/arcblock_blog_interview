//
//  ViewController.swift
//  blog_test
//
//  Created by 张淳 on 2024/12/16.
//

import UIKit

class ViewController: UIViewController {
    let blogListView = BlogListView()

    var currentPage = 1
    let pageSize = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor  = .white
        let button = UIButton(type: .system)
       button.setTitle("点击跳转博客列表", for: .normal)
       button.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)

       // 将按钮添加到视图
       view.addSubview(button)

       // 使用 Auto Layout 约束按钮（使用 iOS 9+ 的约束方式）
       button.translatesAutoresizingMaskIntoConstraints = false
       NSLayoutConstraint.activate([
           button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
       ])
    }
    
    @objc func pushToNextVC() {
            let nextVC = BlogListViewController()
            // 通过导航控制器 push 到下一个页面
            navigationController?.pushViewController(nextVC, animated: true)
        }

}

