//
//  SubjectModel.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import Foundation
class SubjectModel: ObservableObject{
    @Published var subjects = DataManger.shared.fetchSubjects()
    func addSubject(name:String){
        DataManger.shared.addSubject(name: name)
        subjects = DataManger.shared.fetchSubjects()
    }
    func deleteSubject(subject:Subject){
        DataManger.shared.deletSubject(subject: subject)
        subjects = DataManger.shared.fetchSubjects()
    }
    
}
