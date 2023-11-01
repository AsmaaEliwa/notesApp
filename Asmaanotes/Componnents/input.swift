//
//  input.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import SwiftUI


struct input:View{
    @Binding var text: String
    var label:String
    var placeholder:String
    var body: some View{
        VStack(alignment: .leading, spacing:30){
            Text(label).font(.system(size: 25 ,weight: .medium))
            TextField(placeholder , text: $text).textFieldStyle(.roundedBorder)
        }.padding()
    }
}
//#Preview {
//    input()
//}
