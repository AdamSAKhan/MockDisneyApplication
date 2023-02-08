//
//  MainCharacterListView.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import SwiftUI

struct DisneyCharactersView: View {
    
    @State var searchText: String = ""
    @StateObject var viewModel: DisneyCharactersViewModel = DisneyCharactersViewModel(DataService(networkApiClient: NetworkApiClient()))
    @State var searching: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
                if viewModel.networkError != nil {
                    ErrorView()
                    Button {
                        viewModel.networkError = nil
                        Task{
                            await viewModel.getDisneyCharacters(for: DisneyRequest())
                        }
                    } label: {
                        Text("Try loading the data again")
                            .font(.title2)
                    }
                }
                else {
                    TextField("Search for a character", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                        .onChange(of: searchText) { newValue in
                            viewModel.sortCharacter(by: searchText)
                        }
                        .padding()
                    Spacer()
                    if !searchText.isEmpty {
                        if !viewModel.filteredArray.isEmpty {
                            DisneyCharacterList(viewModel.filteredArray)
                        }
                        else {
                            DisneyCharacterList(viewModel.filteredArray, emptySearch: true)
                        }
                    }
                    else {
                        DisneyCharacterList(viewModel.disneyCharacters)
                    }
                }
            }.task {
                await viewModel.getDisneyCharacters(for: DisneyRequest())
            }
            .navigationTitle("Disney Characters")
        }
    }
}

struct MainCharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        DisneyCharactersView()
    }
}
