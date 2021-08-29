//
//  UserRow.swift
//  UserRow
//
//  Created by Alexey Efimov on 27.08.2021.
//

import SwiftUI

struct UserRow: View {
    let user: User
    var body: some View {
        HStack (spacing: 12) {
            Image("imagePlaceholder")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Text(user.name)
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: User(
            id: 1,
            name: "Tim Cook",
            avatarURL: "")
        )
    }
}
