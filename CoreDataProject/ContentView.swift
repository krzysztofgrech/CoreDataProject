//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Krzysztof Grech on 17/08/2022.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    let students: [Student] = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    @State var counter = 0
    
    var body: some View {
        VStack {
            List(students, id: \.self) {student in
                Text(student.name)
            }
            
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown Wizard")
            }
            
            Button("Add Wizard") {
                let wizard = Wizard(context: moc)
                wizard.name = "\(counter) Harry"
                counter += 1
            }
            
            Button("Save") {
                if moc.hasChanges {
                    do {
                        try moc.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
