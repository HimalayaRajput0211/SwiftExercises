//
//  CustomTableViewCell.swift
//  TableView_Exercise
//
//  Created by Himalaya Rajput on 03/03/20.
//  Copyright © 2020 Himalaya Rajput. All rights reserved.
//

import UIKit
class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomCell"
    @IBOutlet private weak var customTextLabel: UILabel!
    @IBOutlet private weak var backgroundImageView: UIImageView!
    
    func configureCell(atIndex indexPath: IndexPath, for labelText: String) {
        customTextLabel.text = labelText
        backgroundImageView.image = backgroundImage(at: indexPath)
        customTextLabel.textColor = textColor(at: indexPath)
    }
    
    private func backgroundImage(at indexpath: IndexPath) -> UIImage? {
        if indexpath.row % 2 == 0 {
            return UIImage(named: "evenBgImage")
        } else {
            return UIImage(named: "oddBgImage")
        }
    }
    
    private func textColor(at indexpath: IndexPath) -> UIColor {
        if indexpath.row % 2 == 0 {
            return UIColor.black
        } else {
            return UIColor.white
        }
    }
}


    

