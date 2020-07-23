//
//  MemberTableViewCell.swift
//  snapkit-demo
//
//  Created by djing on 2020/7/23.
//  Copyright © 2020 djing. All rights reserved.
//

import UIKit
import SnapKit

class MemberTableViewCell: UITableViewCell {
    static let identifier2 = "MemberTableViewCell"
    
    var avatar = UIImageView()
    var titleLabel = UILabel()
    var popUp = UIView()
    var popUpTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(avatar)
        contentView.addSubview(titleLabel)
        
        avatar.layer.borderWidth = 1
        avatar.layer.borderColor = UIColor.gray.cgColor
        avatar.layer.cornerRadius = 10
        avatar.clipsToBounds = true
        
        titleLabel.textAlignment = .left
    }
    
    
    
    public func setupCell(with title: String, layoutStyle: String ){//layoutStyle: Int
        titleLabel.text = "Name:" + title
        avatar.image = UIImage(named: title)
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.2).cgColor
        self.layer.borderWidth = 1
        contentView.addSubview(popUp)
        popUp.addSubview(popUpTitle)
        
        popUp.isHidden = true
        popUp.backgroundColor = UIColor.white
        popUp.snp.makeConstraints{ (make) in
            make.width.height.equalToSuperview()
            make.top.leading.bottom.equalToSuperview()
            
        }
        
        popUpTitle.snp.makeConstraints{ (make) in
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.equalTo(30)
            
        }
        avatar.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.leading.top.bottom.equalToSuperview().inset(16)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(16)
            make.width.equalToSuperview()
            make.leading.equalTo(avatar.snp.trailing).offset(8)
            
        }
        
        
        
    }
    
    public func setPop(with title:String){
        popUpTitle.text = "Email: " + title
        
    }
}
