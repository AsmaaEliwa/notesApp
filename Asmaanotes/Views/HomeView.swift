//
//  HomeView.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import SwiftUI

struct HomeView: View {
    @State var subjectName = ""
    @ObservedObject var subjectsModel = SubjectModel()
    
    var body: some View {
        VStack{
            input(text: $subjectName, label: "Subject Name", placeholder: "Enter Name")
            Button{
                subjectsModel.addSubject(name:subjectName)
            }label: {
                Label("Add Subject", systemImage: "plus")
            }
            List{
                ForEach(Array(subjectsModel.subjects), id:\.self){subject in
                    
                    NavigationLink(destination:SubjectDetailsView( subject:subject)){
                        Text(subject.name ?? "")
                    }
                   
                    
                    
                }
            }
            
        }
    }
}

#Preview {
    HomeView()
}


