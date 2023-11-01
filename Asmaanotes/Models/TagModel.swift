//
//  TagModel.swift
//  Asmaanotes
//
//  Created by asmaa gamal  on 01/11/2023.
//

import Foundation
import Foundation
import Foundation
class TagModel: ObservableObject{
//    @Published var tags = DataManger.shared.fetchTags()
    func addTag(tag:String , note:Note){
        DataManger.shared.addTag(tag: tag, note: note)
//        tags = DataManger.shared.fetchTags()
    }
    
}
