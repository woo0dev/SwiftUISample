//
//  ContentView.swift
//  SwiftUISample
//
//  Created by Woo0 on 2021/02/08.
//

import SwiftUI

struct ContentView: View {
    
    let genderType = ["남성", "여성", "비밀"]
    
    @State var name = ""
    @State var gender = 0
    @State var bornIn = 0
    
    var resultScript:String{
        if(name.isEmpty) {
            return "이름을 입력해주세요."
        } else {
            return "\(name)님은 성별이 \(genderType[gender])이며 나이는 \(120 - bornIn)입니다."
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("이름")){
                    TextField("이름을 입력해주세요.", text: $name).keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                }
                Section(header: Text("생년월일")){
                    Picker("출생년도", selection: $bornIn) {
                        ForEach(1900 ..< 2021) {
                            Text("\(String($0))년생")
                        }
                    }
                }
                Section(header: Text("성별")) {
                    Picker("성별",selection: $gender) {
                        ForEach(0 ..< genderType.count) {
                            Text("\(self.genderType[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("결과")) {
                    Text("\(resultScript)")
                }
            }.navigationTitle("회원가입")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
