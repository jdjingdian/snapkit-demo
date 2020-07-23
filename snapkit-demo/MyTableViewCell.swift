import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {
    static let identifier = "MyTableViewCell"
    
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
        
        avatar.layer.borderWidth = 1
        avatar.layer.borderColor = UIColor.gray.cgColor
        avatar.layer.cornerRadius = 10
        avatar.clipsToBounds = true
        
        titleLabel.textAlignment = .center
    }
    
    public func setPop(with title:String){
        popUpTitle.text = "Email: " + title
        
    }
    
    public func setupCell(with title: String, layoutStyle: String ){//layoutStyle: Int
        titleLabel.text = "Name:" + title
        avatar.image = UIImage(named: title)
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.2).cgColor
        self.layer.borderWidth = 1
        
    //if else布局修改
        
        if(layoutStyle == "Leader"){
            avatar.snp.makeConstraints { (make) in
                make.width.height.equalTo(40)
//                make.center.equalToSuperview()
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().inset(5)
            }
            titleLabel.snp.makeConstraints { (make) in
//                make.top.bottom.equalToSuperview().inset(16)
//                make.width.equalToSuperview()
                make.leading.trailing.greaterThanOrEqualToSuperview()
                make.top.equalTo(avatar.snp.bottom).offset(8)
                make.bottom.equalToSuperview().inset(8)
                make.centerX.equalToSuperview()
            }
            
        }else if(layoutStyle == "Member"){
            avatar.snp.makeConstraints { (make) in
                make.width.height.equalTo(40)
                make.top.leading.bottom.equalToSuperview().inset(16)
            }
            titleLabel.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview().inset(16)
                make.leading.equalTo(avatar.snp.trailing).offset(8)
            }
            
        }else{
            avatar.snp.makeConstraints { (make) in
                make.width.height.equalTo(40)
                make.top.trailing.bottom.equalToSuperview().inset(16)
            }
            titleLabel.snp.makeConstraints { (make) in
                make.top.bottom.equalToSuperview().inset(16)
                make.trailing.equalTo(avatar.snp.leading).offset(-8)
            }
        }
        
        
        
    }
}
