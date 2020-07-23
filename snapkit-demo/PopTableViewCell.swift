//
//  PopTableViewCell.swift
//  snapkit-demo
//
//  Created by djing on 2020/7/23.
//  Copyright © 2020 djing. All rights reserved.
//

import UIKit
import SnapKit

class PopTableViewCell: UITableViewCell {
    static let identifier4 = "PopTableViewCell"
    var popUp = UIView()
    var popUpTitle = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupPop()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPop() {
        contentView.addSubview(popUp)
        contentView.addSubview(popUpTitle)
        popUpTitle.text = "hello"
        popUp.isHidden = false
        popUp.backgroundColor = UIColor.red
        popUp.snp.makeConstraints{ (make) in
            make.width.height.equalToSuperview()
            make.top.leading.bottom.equalToSuperview()
            
        }
        
        popUpTitle.snp.makeConstraints{ (make) in
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.equalTo(30)
            
        }
    }
    
    public func setPop(with title:String){
        popUpTitle.text = "Email: " + title
    }
}
