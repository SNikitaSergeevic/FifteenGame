//
//  MainMenuView.swift
//  Fifteen
//
//  Created by ProstoKakTo on 17.04.2022.
//

import SwiftUI
import Neumorphic
import AVFoundation

struct MainMenuView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment:.center){
                NavigationLink(destination: ContentView(viewModel: viewModel).onAppear{viewModel.shape()}) {
                    Text("New Game")
                }
                .buttonStyle(MenuButtonStyle())
                .padding(.top, 30)
                
                if viewModel.saveGameCount() {
                    NavigationLink(destination: ContentView(viewModel: viewModel).onAppear{viewModel.continueGame()}) {
                        Text("Continue")
                    }
                    .buttonStyle(MenuButtonStyle())
                    .padding(.top, 30)
                }
                
                Button(action: {}, label: {Text("My records")})
                    .buttonStyle(MenuButtonStyle())
                Button(action: {}, label: {Text("Global records")})
                    .buttonStyle(MenuButtonStyle())
                Spacer()
                Button(action: {}, label: {Text("About us")})
                
                
            }
            .navigationTitle(Text("Fifteen"))
        }
    }
}

struct MenuButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.Neumorphic.main).softOuterShadow( offset: 3.5, radius: 4)
                RoundedRectangle(cornerRadius: 10).fill(Color.Neumorphic.main).softInnerShadow(RoundedRectangle(cornerRadius: 10), spread: 0.3, radius: 2 )
            }
            .frame(width: 200, height: 50, alignment: .center)
            configuration.label
                .font(.title3)
                .foregroundColor(.black)
                .clipShape(Capsule())
                .cornerRadius(10)
        }
        .padding(.vertical, 5)
        .aspectRatio(1/1, contentMode: .fill)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(viewModel: ViewModel())
    }
}
