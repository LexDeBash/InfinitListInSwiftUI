//
//  LoaderView.swift
//  LoaderView
//
//  Created by Alexey Efimov on 29.08.2021.
//

import SwiftUI

struct LoaderView: View {
    let isFailed: Bool
    var body: some View {
        Text(isFailed ? "Failed. Tap to retry." : "Loading..")
            .foregroundColor(isFailed ? .red : .green)
            .padding()
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isFailed: false)
    }
}
