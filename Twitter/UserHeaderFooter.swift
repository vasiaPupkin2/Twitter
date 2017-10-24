//
//  Cells.swift
//  Twitter
//
//  Created by leanid niadzelin on 22.02.17.
//  Copyright © 2017 Leanid Niadzelin. All rights reserved.
//

import LBTAComponents

class FooterCell: DatasourceCell {
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.textColor = UIColor(r: 61, g: 167, b: 244)
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        let footerUnderWhiteView: UIView = UIView()
        footerUnderWhiteView.backgroundColor = .white
        
        addSubview(footerUnderWhiteView)
        addSubview(footerLabel)
        
        footerUnderWhiteView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        footerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 28, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class HeaderCell: DatasourceCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(textLabel)
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        textLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 16 , bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

