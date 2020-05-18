//  Copyright © 2019 SEEK Limited. All rights reserved.
//

import Foundation

public extension CGColor {
    static func color(_ colorAsset: SKColorAsset, bundle: Bundle = .seekUIKit) -> CGColor {
        return UIColor.color(colorAsset, bundle: bundle).cgColor
    }
}
