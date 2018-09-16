//
//  TableViewHandler.swift
//  TesteiOS
//
//  Created by Nicolau on 16/09/18.
//  Copyright © 2018 {lfn}. All rights reserved.
//

import UIKit
import SafariServices

extension FundVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        if let infoCell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as? InfoCell {
            infoCell.configureView(for: info[row])
            
            if info[row].data != nil {
                infoCell.downloadButton.addTarget(self, action: #selector(onTap), for: .touchUpInside)
            }
            
            return infoCell
        }
        
        return UITableViewCell()
    }
    
    @objc func onTap() {
        if let url = URL(string: link) {
            let svc = SFSafariViewController(url: url)
            self.present(svc, animated: true, completion: nil)
        }
    }
}
