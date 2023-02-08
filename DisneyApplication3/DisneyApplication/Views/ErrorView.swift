//
//  ErrorView.swift
//  DisneyApplication
//
//  Created by Adam Khan on 25/01/2023.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        Text("There was an error downlaoding the data")
            .font(.title)
            .multilineTextAlignment(.center)
            .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
