//
//  Model.swift
//  ContactsApp
//
//  Created by Julien on 30/08/21.
//

import Foundation
class Model{
    var contactList=[["Julien Joseph Thomas", "+91-9495718991", "abc@gmail.com"],["Bill Gates",      "+1-202-5358-9793", "abc@gmail.com"],
                     ["Tim Cook",        "+1-203-2384-6264", "abc@gmail.com"],
                     ["Richard Branson", "+1-204-3383-2795", "abc@gmail.com"],
                     ["Jeff Bezos",      "+1-205-0288-4197", "abc@gmail.com"],]
    
    
    func addtoList(data name: Array<String>) {
        self.contactList.append(name)
        print(self.contactList)
        
    }
    func getListCount() -> Int {
        return self.contactList.count
    }
}
