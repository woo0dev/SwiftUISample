//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Woo0 on 2021/02/08.
//

import SwiftUI

struct CarMaker {
    let name: String
    let imageUrl: String
    let numberOfStore: Int
}

extension CarMaker {
    static func all() -> [CarMaker] {
        return [
            CarMaker(name: "기아자동차", imageUrl: "car1", numberOfStore: 2000),
            CarMaker(name: "현대자동차", imageUrl: "car2", numberOfStore: 2100),
            CarMaker(name: "쌍용자동차", imageUrl: "car3", numberOfStore: 2200)
        ]
    }
}

struct ContentView: View {
    
    let carMakers = CarMaker.all()
    
    var body: some View {
        List(self.carMakers, id: \.name) {
            carMaker in CarMakerCell(carMaker: carMaker)
        }
    }
}

struct CarMakerCell: View {
    let carMaker: CarMaker
    var body: some View {
        HStack {
            Image(carMaker.imageUrl).resizable().frame(width: 100, height: 100).cornerRadius(16)
            VStack(alignment: .leading) {
                Text(carMaker.name).font(.largeTitle)
                Text("\(carMaker.numberOfStore) 지점")
            }
        }
    }   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
