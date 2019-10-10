//
//  ContentView.swift
//  LIstViewDeletionDraggingMovingDataBetweenCells
//
//  Created by ramil on 10.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        cust()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct cust: View {
    @State var data = ["1", "2", "3", "4", "5", "6"]
    var body: some View {
        NavigationView {
            List {
                ForEach(data, id: \.self) { i in
                    Text(i)
                }.onDelete(perform: { (index) in
                    
                    self.data.remove(atOffsets: index)
                    
                }).onMove(perform: { (index, destination) in
                    
                    self.data.move(fromOffsets: index, toOffset: destination)
                    
                })
            }.navigationBarTitle("ListView")
            .navigationBarItems(trailing: EditButton())
        }
    }
}
