//
//  ContentView.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/3/20.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
//        KFImage(URL(string: "https://github.com/xiaoyouxinqing/PostDemo/raw/master/PostDemo/Resources/006PdkDogy1gap6ngiyn3j30u011idle.jpg")!)
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"),
                  message: Text("This is some detail message"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
