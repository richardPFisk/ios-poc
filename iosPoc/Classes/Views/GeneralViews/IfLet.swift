//
//  IfLet.swift
//
//  Created by Richard Fisk on 28/4/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import SwiftUI

struct IfLet<Value, Content, NilContent>: View where Content: View, NilContent: View {

    let value: Value?
    let contentBuilder: (Value) -> Content
    let nilContentBuilder: () -> NilContent

    init(_ optionalValue: Value?, @ViewBuilder whenPresent contentBuilder: @escaping (Value) -> Content, @ViewBuilder whenNil nilContentBuilder: @escaping () -> NilContent) {
        self.value = optionalValue
        self.contentBuilder = contentBuilder
        self.nilContentBuilder = nilContentBuilder
    }

    var body: some View {
        Group {
            if value != nil {
                contentBuilder(value!)
            } else {
                nilContentBuilder()
            }
        }
    }
}

extension IfLet where NilContent == EmptyView {

    init(_ optionalValue: Value?, @ViewBuilder whenPresent contentBuilder: @escaping (Value) -> Content) {
        self.init(optionalValue, whenPresent: contentBuilder, whenNil: { EmptyView() })
    }
}
