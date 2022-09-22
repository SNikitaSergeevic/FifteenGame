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
    @EnvironmentObject var viewModelNewGame: ViewModelNewGame
    @EnvironmentObject var viewModelContinueGame: ViewModelContinueGame
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack(alignment:.center){
                if viewModelNewGame.saveGameCount() {
                    HStack {
                        Spacer()
                        NavigationLink(destination: NewGameView().onAppear{viewModelNewGame.shape()}) {
                            Text("New Game")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                            
                        }
                        .padding()
                    }
                    NavigationLink(destination: ContinueGameView().onAppear{}) {
                        Text("Continue")
                           
                    }
                    .buttonStyle(MenuButtonStyle())
                    .padding(.top, 30)
                    
                    
                    
                } else {
                    NavigationLink(destination: NewGameView()) {
                        Text("New Game")
                    }
                    .buttonStyle(MenuButtonStyle())
                    .padding(.top, 30)
                }
                
                Button(action: {}, label: {Text("My records(in work)")})
                    .buttonStyle(MenuButtonStyle())
//                Button(action: {}, label: {Text("Global records")})
//                    .buttonStyle(MenuButtonStyle())
                Spacer()
//                Button(action: {}, label: {Text("About us")})
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    
                    HStack {
                        Text("Fifteen")
                            .font(.system(size: 30, weight: .bold, design: .default))
                        Spacer()
                        
                    }
                    .padding()
                }
            }
        }
    }
}

struct MenuButtonStyle: ButtonStyle {
    
    @Environment(\.colorScheme) var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.Neumorphic.main).softOuterShadow( offset: 3.5, radius: 4)
                RoundedRectangle(cornerRadius: 10).fill(Color.Neumorphic.main).softInnerShadow(RoundedRectangle(cornerRadius: 10), spread: 0.3, radius: 2 )
            }
            .frame(width: 200, height: 50, alignment: .center)
            configuration.label
                .font(.title3)
                .clipShape(Capsule())
                .cornerRadius(10)
        }
        .padding(.vertical, 5)
        .aspectRatio(1/1, contentMode: .fill)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
