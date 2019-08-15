//
//  DownloadInfoRow.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit
import Eureka

final class DownloadInfoRow<T: Equatable>: Row<DownloadInfoCell<T>>, RowType {
    
    // MARK: - Actions
    func onDonwloadButtonTap(_ block: @escaping DownloadButton.ButtonBlock) {
        cell.downloadButton.onTap(block)
    }
    
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}
