//
//  DocumentScreen.swift
//  TaskManagement
//
//  Created by Radian Rasyid on 16/09/24.
//

import SwiftUI

struct DocumentScreen: View {
    var body: some View {
        NavigationStack{
            List{
                Text("Document Screen")
            }
            .navigationTitle("Files")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    DocumentScreen()
}
