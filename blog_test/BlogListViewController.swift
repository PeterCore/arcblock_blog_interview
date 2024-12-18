//
//  BlogListViewController.swift
//  blog_test
//
//  Created by 张淳 on 2024/12/16.
//

import UIKit

class BlogListViewController: UIViewController {
    let blogListView = BlogListView()

    var currentPage = 1
    let pageSize = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor  = .white
        view.addSubview(blogListView)
        blogListView.snp.makeConstraints { make in
           make.edges.equalToSuperview()
        }
        loadData(page: 1);
    }
    
    func loadData(page: Int) {
          NetworkManager.shared.fetchBlogs(page: page, size: pageSize) { result in
              switch result {
              case .success(let blogResponse):
                  // 成功获取数据，在此处理 blogResponse.data
                  // 注意：Alamofire 的回调默认是在主线程执行，可直接刷新 UI
        
                  self.blogListView.updatePosts(blogResponse.data)
                  self.blogListView.hideSkeleton();
                
                 // 例如：currentPage += 1
              case .failure(let error):
                  // 处理错误，比如弹出一个提示框
                  print("请求失败:", error)
              }
          }
      }
      
      // 当你需要加载下一页时
      func loadNextPage() {
          currentPage += 1
          loadData(page: currentPage)
      }


}
