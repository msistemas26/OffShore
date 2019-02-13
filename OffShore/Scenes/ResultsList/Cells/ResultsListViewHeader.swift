//
//  ResultsListViewHeader.swift
//  OffShore
//
//  Created by Raul Mantilla on 13/02/19.
//  Copyright (c) 2019 Raul Mantilla Assia. All rights reserved.
//

import UIKit

class ResultsListViewHeader: UICollectionReusableView {
    
    let title: UILabel = {
        let text = UILabel()
        text.font = DefaultFonts.headerFont
        text.textColor = DefaultColors.blueColor
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public func setup() {
        addSubview(title)
        self.backgroundColor = DefaultColors.headerColor
        title.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = title.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        horizontalConstraint.constant = 20
        let verticalConstraint = title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
    
    public func setTitle(withTitle text: String) {
        title.text = text
    }
}
