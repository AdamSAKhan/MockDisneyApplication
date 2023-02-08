//
//  DisneyCharacterList.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import SwiftUI

/// Displays the disney characters in list format using Disney character List cell as the main subview
/// Displays "Loading characters." when there are no elements within the characters array and the elements are being loaded
/// Displays "No characters matching your search" for empty search quesries, with bool option to be handled by higher level code
internal struct DisneyCharacterList: View {
    
    /// Set to var as higher level views (such as the filter view will have a changing character list)
    var charaters: [DisneyCharacter]
    
    @State var isShowing: Bool = false
    @State var emptySearch: Bool 
    
    init(_ charaters: [DisneyCharacter], emptySearch: Bool = false) {
        self.charaters = charaters
        self.emptySearch = emptySearch
    }
    
    var body: some View {
        if emptySearch == true {
            List(0..<1) { item in
                Text("No characters matching your search.")
                    .listNotificationModifier()
            }
        }
        else {
            if charaters.isEmpty {
                List(0..<1) { item in
                    Text("Loading characters!")
                        .listNotificationModifier()
                }
            }
            else {
                List {
                    ForEach(charaters, id: \.self) { charater in
                        NavigationLink{
                            CharacterDetails(charater)
                        }
                    label: {
                        DisneyCharacterListCell(character: charater)
                    }
                    .listRowSeparator(.hidden)
                    }
                }
            }
        }
    }
}

struct DisneyCharacterList_Previews: PreviewProvider {
    static var previews: some View {
        DisneyCharacterList([], emptySearch: false)
    }
}
