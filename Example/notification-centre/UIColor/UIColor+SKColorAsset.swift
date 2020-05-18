//  Copyright © 2019 SEEK Limited. All rights reserved.
//

import Foundation

public extension UIColor {
    static func color(_ colorAsset: SKColorAsset, bundle: Bundle = .seekUIKit) -> UIColor {
        return UIColor(
            named: colorAsset.rawValue,
            in: bundle,
            compatibleWith: nil
        )!
    }
}
