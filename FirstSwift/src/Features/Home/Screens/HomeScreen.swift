//
//  SwiftUIView.swift
//  FirstSwift
//
//  Created by PhungPV_TCOM on 26/08/2023.
//

import SwiftUI

struct HomeScreen: View {
    @State var selection: Int = 0
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        Text("Hello, HomeScreen!")

    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
