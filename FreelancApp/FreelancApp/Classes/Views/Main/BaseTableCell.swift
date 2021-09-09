//
//  BaseTableCell.swift
//  FreelancApp
//
//  Created by Rizvi on 9/6/21.
//

import UIKit

class BaseTableCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /* ==================================================
     Need to override this method to load UI setup for tableview cell
     ================================================== */
    func setupCellViews() {}

}
