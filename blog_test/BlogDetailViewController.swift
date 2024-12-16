//
//  BlogDetailController.swift
//  blog_test
//
//  Created by 张淳 on 2024/12/16.
//

import Foundation
import UIKit
import WebKit
import SkeletonView

class BlogDetailViewController: UIViewController {
    private let url: URL
    private var webView: WKWebView!
    private var skeletonView: UIView! // 骨架覆盖层
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // 创建 WKWebView
        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = self
        webView.isOpaque = false
        view.addSubview(webView)

        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // 创建骨架覆盖层
        skeletonView = UIView()
        skeletonView.isSkeletonable = true
        view.addSubview(skeletonView)
        skeletonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skeletonView.topAnchor.constraint(equalTo: webView.topAnchor),
            skeletonView.leadingAnchor.constraint(equalTo: webView.leadingAnchor),
            skeletonView.trailingAnchor.constraint(equalTo: webView.trailingAnchor),
            skeletonView.bottomAnchor.constraint(equalTo: webView.bottomAnchor)
        ])

        // 在骨架层上展示骨架动画
        // 这里为简单起见，就整块区域展示骨架
        // 你可以根据实际需要添加子视图并设置 isSkeletonable = true
        skeletonView.showAnimatedGradientSkeleton()

        // 开始加载网页
        let request = URLRequest(url: url)
        webView.load(request)
    }

    // 隐藏骨架
    private func hideSkeletonView() {
        skeletonView.hideSkeleton()
        skeletonView.removeFromSuperview()
        skeletonView = nil
    }
}

extension BlogDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // 当网页加载完成时，隐藏骨架层
        hideSkeletonView()
    }
}
