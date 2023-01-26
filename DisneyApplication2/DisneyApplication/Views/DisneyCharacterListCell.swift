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
    
    init(_ character: DisneyCharacter) {
        self.character = character
    }
    
    var body: some View {
        HStack{
            ImageDownloading(character.imageURL)
                .frame(width: 120,height: 120)
                .padding(.horizontal)
            
            CharacterDetailsForList(character.name)
                .frame(maxWidth: .infinity)
                .padding()
                
        }
        .background{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.gray)
                .opacity(0.05)
                .blur(radius: 15)
        }
    }
}

struct DisneyCharacterListCell_Previews: PreviewProvider {
    static var previews: some View {
        DisneyCharacterListCell(DummyData.shared.dummyCharacter)
    }
}
