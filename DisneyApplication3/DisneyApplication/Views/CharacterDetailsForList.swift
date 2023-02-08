//
//  CharacterDetailsForList.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import SwiftUI

/// Displays the characters details in VStack for the main List
internal struct CharacterDetailsForList: View {
    
    /// The given character
    let characterName: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(characterName)
                .listTextModifier()
                .lineLimit(nil)
                .multilineTextAlignment(TextAlignment.leading)
            Spacer()
        }
    }
}

struct CharacterDetailsForList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsForList(characterName: DummyData.shared.dummyCharacter.name)
    }
}
