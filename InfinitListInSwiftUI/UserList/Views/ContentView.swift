//
//  ContentView.swift
//  InfinitListInSwiftUI
//
//  Created by Alexey Efimov on 27.08.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userViewModel.users, id: \.id) { user in
                    UserRow(user: user)
                }
                LoaderView(isFailed: userViewModel.isRequestFailed)
                    .onAppear(perform: fetchData)
                    .onTapGesture(perform: onTapLoadView)
            }
            .navigationTitle("GitHub Users")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    private func fetchData() {
        userViewModel.getUsers()
    }
    
    private func onTapLoadView() {
        if userViewModel.isRequestFailed {
            userViewModel.isRequestFailed = false
            fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
