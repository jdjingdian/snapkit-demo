//
//  ResignTableViewCell.swift
//  snapkit-demo
//
//  Created by djing on 2020/7/23.
//  Copyright © 2020 djing. All rights reserved.
//

import UIKit
import SnapKit

class ResignTableViewCell: UITableViewCell {
    static let identifier3 = "ResignTableViewCell"
    
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
        
        titleLabel.textAlignment = .right
    }
    
    public func setupCell(with title: String, layoutStyle: String ){//layoutStyle: Int
        titleLabel.text = "Name:" + title
        titleLabel.textColor = .gray
        avatar.image = UIImage(named: title)
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.2).cgColor
        self.layer.borderWidth = 1
        contentView.addSubview(popUp)
        popUp.addSubview(popUpTitle)
        
        popUp.isHidden = true
        popUp.backgroundColor = UIColor.white
        popUpTitle.textColor = .gray
        popUpTitle.textAlignment = .right
        popUp.snp.makeConstraints{ (make) in
            make.width.height.equalToSuperview()
            make.top.leading.bottom.equalToSuperview()
            
        }
        
        popUpTitle.snp.makeConstraints{ (make) in
            make.top.trailing.bottom.equalToSuperview().inset(16)
            
        }
        avatar.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
            make.top.trailing.bottom.equalToSuperview().inset(16)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(16)
            make.width.equalToSuperview()
            make.trailing.equalTo(avatar.snp.leading).offset(-8)
        }
        
        
        
    }
    
    public func setPop(with title:String){
        popUpTitle.text = "Email: " + title
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
