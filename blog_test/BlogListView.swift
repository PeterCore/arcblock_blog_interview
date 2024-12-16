//
//  BlogListView.swift
//  blog_test
//
//  Created by 张淳 on 2024/12/16.
//

import Foundation
import UIKit
import SkeletonView

class BlogListView: UIView, UITableViewDelegate, SkeletonTableViewDataSource {
 
    
   
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
    private let tableView = UITableView(frame: .zero, style: .plain)
    var posts: [BlogPost] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        showSkeleton()

    }
    
   func showSkeleton() {
       tableView.showAnimatedGradientSkeleton()
   }
       
   func hideSkeleton() {
       tableView.hideSkeleton()
   }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
          addSubview(tableView)
          tableView.register(BlogPostCell.self, forCellReuseIdentifier: "BlogPostCell")
          tableView.separatorStyle = .none
          tableView.isSkeletonable = true
          isSkeletonable = true
          
          tableView.snp.makeConstraints { make in
              make.edges.equalToSuperview()
          }
          
          tableView.dataSource = self
          tableView.delegate = self
          tableView.estimatedRowHeight = 250
          tableView.rowHeight = UITableView.automaticDimension
    }
    
    // 对外提供更新数据的方法
    func updatePosts(_ newPosts: [BlogPost]) {
        self.posts = newPosts
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource & Delegate

    //skelentonView
     func numSections(in collectionSkeletonView: UITableView) -> Int {
         return 1
     }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.isEmpty ? 5 : posts.count

    }
//    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.isEmpty ? 5 : posts.count
    }
        
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "BlogPostCell"
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, skeletonCellForRowAt indexPath: IndexPath) -> UITableViewCell? {
        guard let cell = skeletonView.dequeueReusableCell(withIdentifier: "BlogPostCell", for: indexPath) as? BlogPostCell else {
            return UITableViewCell()
        }
        if !posts.isEmpty {
                  let post = posts[indexPath.row]
                  cell.configure(with: post)
              }
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BlogPostCell", for: indexPath) as? BlogPostCell else {
            return UITableViewCell()
        }
        if !posts.isEmpty {
                  let post = posts[indexPath.row]
                  cell.configure(with: post)
              }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 可在此添加点击 Cell 的回调逻辑（如通过 delegate 回调给外部的 ViewController）
        print("123131313")
    }
}
