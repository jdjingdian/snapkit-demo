import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {
    static let identifier = "MyTableViewCell"
    
    var view = UIImageView()
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
        contentView.addSubview(view)
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
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
            make.top.leading.bottom.equalToSuperview().inset(16)
        }        
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.equalTo(view.snp.trailing).offset(8)
        }
    }
    
    public func setPop(with title:String){
        popUpTitle.text = "Email: " + title
        
    }
    
    public func setupCell(with title: String){
        titleLabel.text = "Name:" + title
        view.image = UIImage(named: title)
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.2).cgColor
        self.layer.borderWidth = 1
    }
}
