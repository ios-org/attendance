//
//  ExpandableHeaderView.swift
//  weInternet
//
//  Created by Abdelrhman on 4/7/20.
//  Copyright © 2020 ahmedfouad. All rights reserved.
//

import UIKit

protocol ExpandableHeaderViewDelegate {
    func toggleSection(header: ExpandableHeaderView, section: Int)
}

class ExpandableHeaderView: UITableViewHeaderFooterView {
    var delegate: ExpandableHeaderViewDelegate?
    var section: Int!
    let imageView = UIImageView()
    var sectionState = false
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.semanticContentAttribute = .forceRightToLeft
        return label
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    
    
    
    func customInit(title: String, section: Int, delegate: ExpandableHeaderViewDelegate,image:UIImage ) {
        self.label.text = title
//        textLabel?.backgroundColor = .yellow
//        label.textAlignment = .right
        self.section = section
        self.delegate = delegate
        imageView.image = #imageLiteral(resourceName: "bottomArrow")
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true

        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.font = UIFont(name: "DroidArabicKufi-Bold", size: 12)
        //  self.textLabel?.textColor = UIColor.black
        self.contentView.backgroundColor = UIColor.white
        //        label.frame = textLabel!.frame
        addSubview(label)

        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6.0).isActive = true
        label.heightAnchor.constraint(equalToConstant: 24.0).isActive = true

    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
