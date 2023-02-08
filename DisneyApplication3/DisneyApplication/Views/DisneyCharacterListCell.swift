//
//  DisneyCharacterListCell.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import SwiftUI

/// Disney character list cell
internal struct DisneyCharacterListCell: View {
    
    /// Disney character
    let character: DisneyCharacter
    
    var body: some View {
        HStack{
            ImageView(character)
                .frame(width: 100,height: 100)
            
            CharacterDetailsForList(characterName: character.name)
                .frame(maxWidth: .infinity)
        }
    }
}

struct DisneyCharacterListCell_Previews: PreviewProvider {
    static var previews: some View {
        DisneyCharacterListCell(character: DummyData.shared.dummyCharacter)
    }
}
