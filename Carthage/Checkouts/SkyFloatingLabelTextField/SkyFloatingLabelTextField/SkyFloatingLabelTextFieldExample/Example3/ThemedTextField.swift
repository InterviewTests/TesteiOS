//  Copyright 2016-2017 Skyscanner Ltd
//
//  Licensed under the Apache License, Version 2.0 (the "License"); 
//  you may not use this file except in compliance with the License. 
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software distributed under the
//  License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
//  either express or implied. See the License for the specific language governing permissions
//  and limitations under the License.

import UIKit

public class ThemedTextField: SkyFloatingLabelTextField {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupTheme()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupTheme()
    }

    private func setupTheme() {

        let blueColor = UIColor(red: 0.0, green: 221.0 / 256.0, blue: 238.0 / 256.0, alpha: 1.0)

        font = .systemFont(ofSize: 18.0)
        if let font = font {
            placeholderFont = .italicSystemFont(ofSize: font.pointSize)
        }

        errorColor = .red
        textColor = .white
        selectedLineColor = blueColor
        lineColor = .white
        titleColor = .white
        selectedTitleColor = blueColor
    }
}
