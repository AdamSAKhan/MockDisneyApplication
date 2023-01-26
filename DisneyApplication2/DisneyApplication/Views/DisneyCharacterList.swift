//
//  DisneyCharacterList.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import SwiftUI

/// Displays the disney characters in list format using Disney character List cell as the main subview
/// Displays "Sorry, there are no characters right now." when there are no elements within the characters array
internal struct DisneyCharacterList: View {
    
    /// Set to var as higher level views (such as the filter view will have a changing character list)
    var charaters: [DisneyCharacter]
    
    @State var isShowing: Bool = false
    
    init(_ charaters: [DisneyCharacter]) {
        self.charaters = charaters
    }
    
    var body: some View {
        if charaters.isEmpty {
            List(0..<1) { item in
                Text("Sorry, there are no characters.")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                .padding()
            }
        }
        else {
            List {
                ForEach(charaters, id: \.self) { charater in
                    NavigationLink{
                        CharacterDetails(charater)
                    }
                    label: {
                        DisneyCharacterListCell(charater)
                        EmptyView()
                    }
                    .listRowSeparator(.hidden)
                }
            }
        }
    }
}

struct DisneyCharacterList_Previews: PreviewProvider {
    static var previews: some View {
        DisneyCharacterList(DummyData.shared.dummyCharacters)
    }
}
