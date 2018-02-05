//
//  Notify.swift
//  Quotivate Me
//
//  Created by Siddique on 05/02/18.
//  Copyright © 2018 Siddique. All rights reserved.
//

import UIKit

class Notify: UITableViewCell {
    let label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var enable: UISwitch = {
        let enable = UISwitch()
        enable.isOn = false
        enable.translatesAutoresizingMaskIntoConstraints = false
        return enable
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        addSubview(enable)
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        enable.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true
        enable.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        enable.widthAnchor.constraint(equalToConstant: 20).isActive = true
        enable.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
         
        // Configure the view for the selected state
    }

}
