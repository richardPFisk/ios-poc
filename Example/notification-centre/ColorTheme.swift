//
//  ColorTheme.swift
//  notification-centre_Example
//
//  Created by Richard Fisk on 18/5/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import SwiftUI

struct ColorThemeProvider {
    static func colors() -> Dictionary<String, Color> {
        var values = [String : Color]()

        values["backgroundNeutral"] = Color("backgroundNeutral")
        values["textPositive"] = Color("textPositive")
        values["backgroundPositive"] = Color("backgroundPositive")
        values["textPrimary"] = Color("textPrimary")
        values["textNeutral"] = Color("textNeutral")
        values["backgroundPrimary"] = Color("backgroundPrimary")
        values["backgroundBrand"] = Color("backgroundBrand")
        values["snackbarBackground"] = Color("snackbarBackground")
        
        return values
    }
}
