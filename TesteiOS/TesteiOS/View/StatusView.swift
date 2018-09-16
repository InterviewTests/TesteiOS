//
//  StatusView.swift
//  TesteiOS
//
//  Created by Nicolau on 13/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit

enum Status {
    case noFocus
    case focused
    case correct
    case incorrect
}

class StatusView: UIView {
    var status: Status = .noFocus
    let topSpacing: CGFloat = 10
    let height: CGFloat = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: frame.height + topSpacing, width: UIScreen.main.bounds.width - 60, height: height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func changeStatus(to status: Status) {
        self.status = status
        
        switch status {
        case .focused:
            self.backgroundColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
            break
        case .correct:
            self.backgroundColor = #colorLiteral(red: 0.3960784314, green: 0.7450980392, blue: 0.1882352941, alpha: 1)
            break
        case .incorrect:
            self.backgroundColor = #colorLiteral(red: 1, green: 0.1215686275, blue: 0.1215686275, alpha: 1)
            break
        default:
            self.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9333333333, blue: 0.9294117647, alpha: 1)
            break
        }
        layoutSubviews()
    }
}
