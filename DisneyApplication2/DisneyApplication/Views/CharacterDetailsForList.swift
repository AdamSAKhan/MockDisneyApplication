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
    
    init(_ characterName: String) {
        self.characterName = characterName
    }
    
    var body: some View {
        Text(characterName)
            .listTextModifier()
            .padding()
            .multilineTextAlignment(.leading)
    }
}

struct CharacterDetailsForList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsForList(DummyData.shared.dummyCharacter.name)
    }
}
