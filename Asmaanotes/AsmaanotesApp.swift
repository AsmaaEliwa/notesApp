//
//  AsmaanotesApp.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import SwiftUI

@main
struct AsmaanotesApp: App {
  

    var body: some Scene {
        WindowGroup {
            NavigationStack{
                Splash()
                    .environment(\.managedObjectContext, DataManger.shared.persistentContainer.viewContext)
            }
        }
    }
}

