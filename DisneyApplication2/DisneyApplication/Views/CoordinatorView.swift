//
//  CoordinatorView.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import SwiftUI

/// Final view used to present the Disney characters
struct CoordinatorView: View {
    
    @State var searchText: String = ""
    @StateObject var vm: CoordinatorVM = CoordinatorVM(NetworkApiClient(), request: DisneyRequest())
    @State var searching: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack{
                if vm.networkError != nil {
                    ErrorView()
                    Button {
                        vm.networkError = nil
                        Task{
                            await vm.downloadDisneyCharacters()
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
                            vm.sortCharacterByName(searchText)
                        }
                        .padding()
                    Spacer()
                    if !searchText.isEmpty {
                        DisneyCharacterList(vm.filteredArray)
                    }
                    else {
                        DisneyCharacterList(vm.disneyCharacters)
                    }
                    
                    
                }
            }.task {
                await vm.downloadDisneyCharacters()
            }
        }
    }
    
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
