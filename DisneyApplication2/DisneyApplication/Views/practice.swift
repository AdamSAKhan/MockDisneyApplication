//
//  practice.swift
//  DisneyApplication
//
//  Created by Adam Khan on 25/01/2023.
//

import SwiftUI

struct practice: View {
    @State var isShowing = false
    var body: some View {
        Button("Tap me") {
            withAnimation {
                isShowing.toggle()
            }
        }
    }
}

struct practice_Previews: PreviewProvider {
    static var previews: some View {
        practice()
    }
}
