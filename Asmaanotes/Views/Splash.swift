//
//  Splash.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue , .white], startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
            NavigationLink(destination:HomeView()){
                Label("Get Start",systemImage: "arrow.fill").foregroundColor(.white).shadow(color: .white , radius: 10).font(.system(size: 30 ,weight: .bold))
            }
        }
    }
}
#Preview {
    Splash()
}
