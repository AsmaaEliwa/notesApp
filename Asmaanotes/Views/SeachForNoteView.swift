//
//  SeachForNoteView.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import SwiftUI

struct SeachForNoteView: View {
    @State var tag = ""
    @State var result: [Note]?

    var body: some View {
        
        input(text: $tag, label: "Enter Tag", placeholder: "#Tag")
        Button{
            result = DataManger.shared.fetchNotesByTag(tag: tag)
        }label: {
            Label("Search",systemImage: "search")
        }
    }
    
}

//#Preview {
//    SeachForNoteView()
//}
