//
//  BlogPostCell.swift
//  blog_test
//
//  Created by 张淳 on 2024/12/16.
//

import UIKit
import Kingfisher
import TagListView
import SnapKit
import SkeletonView


class BlogPostCell: UITableViewCell {
    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        imageView.layer.masksToBounds = true
        imageView.isSkeletonable = true;
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = " "
        label.isSkeletonable = true
        return label
    }()
    
    let tagsView: TagListView = {
        let tagList = TagListView()
        tagList.textFont = UIFont.systemFont(ofSize: 14)
        tagList.alignment = .leading
        
        // 设置标签背景色为浅灰色
        tagList.tagBackgroundColor = UIColor(red: 237/255.0, green: 237/255.0, blue: 237/255.0, alpha: 1.0)
        // 字体颜色为黑色
        tagList.textColor = .black
        // 设置边框颜色与宽度
        tagList.borderColor = UIColor.gray
        tagList.borderWidth = 1
        // 设置圆角
        tagList.cornerRadius = 4
        // 增加标签间距，根据需要调节
        tagList.marginX = 5
        tagList.marginY = 5
        tagList.paddingX = 8
        tagList.paddingY = 5

        return tagList
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 1
        label.isSkeletonable = true
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        isSkeletonable = true
        contentView.isSkeletonable = true
        
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(tagsView)
        contentView.addSubview(dateLabel)
        
        coverImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(180)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(coverImageView.snp.bottom).offset(12)
            make.leading.equalTo(coverImageView)
            make.trailing.equalTo(coverImageView)
        }
        
        tagsView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(tagsView.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with post: BlogPost) {
        let coverUrl = "https://www.arcblock.io/blog/uploads/\(post.cover)";
        if let url = URL(string: coverUrl) {
            coverImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        } else {
            coverImageView.image = UIImage(systemName: "photo")
        }
        
        titleLabel.text = post.title
        
        tagsView.removeAllTags()
        for label in post.labels {
            tagsView.addTag(label)
        }
        
        dateLabel.text = post.updatedAt.toDateString()
    }
}
