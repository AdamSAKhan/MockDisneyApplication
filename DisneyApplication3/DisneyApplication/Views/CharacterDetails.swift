//
//  CharacterDetails.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import SwiftUI
/// UIKit views are contained within this file to avoid UIKit framework be accessed in multiple places
import UIKit

/// Takes UIKit view from structs of UIViewRepresentable and displays the character
internal struct CharacterDetails: View {
    
    let character: DisneyCharacter
    
    let detail: String
    
    init(_ character: DisneyCharacter) {
        self.character = character
        let tempArray: [String] = character.tvShows + character.videoGames + character.shortFilms + character.films
        let newList = tempArray.filter{$0 != ""}
        if newList == [] {
            self.detail = "No Known Appearences"
        }
        else {
            if newList.count > 2 {
                var returnedString = "Appeared in"
                for (index, name) in newList.enumerated() {
                    if index == 0 {
                        returnedString.append(" \(name)")
                    }
                    else if (index - newList.count) == 1 {
                        returnedString.append("and \(name)")
                    }
                    else{
                        returnedString.append(", \(name)")
                    }
                }
                self.detail = returnedString
            }
            else {
                var returnedString = "Appeared in"
                for (index, name) in newList.enumerated() {
                    if index == 0 {
                        returnedString.append(" \(name)")
                    }
                    else{
                        returnedString.append("and \(name)")
                    }
                }
                self.detail = returnedString
            }
        }
    }
    
    var body: some View {
        VStack{
            ImageView(character)
                .frame(height: 400)
            Group{
                CharacterTitleDetails(self.character.name)
                    .frame(height: 100)
                CharacterAppearencesDetails(detail)
                    .frame(height: 90)
                    .padding()
            }
        }
        
        .navigationTitle("Character Details")
    }
}

struct CharacterDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetails(DummyData.shared.dummyCharacters[2])
    }
}

//MARK: UIKit UIViewRepresentable Structs


/// Make the character Name
fileprivate struct CharacterTitleDetails: UIViewRepresentable{
    
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    func makeUIView(context: Context) -> some UIView {
        let label = UILabel()
        label.text = self.title
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: UIFont.Weight(rawValue: 1) )
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = 150
        return label
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

/// Make the character Name
fileprivate struct CharacterAppearencesDetails: UIViewRepresentable{
    
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    func makeUIView(context: Context) -> some UILabel {
        let label = UILabel()
        label.text = self.title
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 0.5) )
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = 150
        return label
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.numberOfLines = 0
    }
}




