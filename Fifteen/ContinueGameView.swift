//
//  ContinueGameView.swift
//  Fifteen
//
//  Created by NikitaSergeevich on 21/09/2022.
//

import SwiftUI
import Neumorphic
import AVFoundation

struct ContinueGameView: View {
    
    @EnvironmentObject var viewModel: ViewModelContinueGame
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                
                
                Spacer()
                
                Text ("Moves: \(viewModel.model.quantityMove)")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.trailing)
                    .padding(.all)
                
                FieldContinueGameView(viewModel: viewModel)
                
                Spacer()
                
                
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action:{
            self.presentationMode.wrappedValue.dismiss()
            viewModel.saveGame()
        }){
            Text("Back menu")
                .font(.title3)
                .foregroundColor(colorScheme == .dark ? .white : .black)
        }
        )
    }
}

struct FieldContinueGameView: View {
    @ObservedObject var viewModel: ViewModelContinueGame
    @State var tap = false
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: 20).fill(Color.Neumorphic.main)
            LazyVGrid(columns: [GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80)), GridItem(.fixed(80)) ] ) {
                
                ForEach (0..<viewModel.model.gameField.count) { number in
                    CellView(content: viewModel.model.gameField[number].content.id)
                        .padding()
                        .scaleEffect(viewModel.model.gameField[number].content.tap ? 1.15 : 1)
                        .animation(.spring(response: 0.6, dampingFraction: 0.4))
                        .gesture(
                            LongPressGesture(minimumDuration: 0.001, maximumDistance: 0.1)
                                .onEnded { value in
                                    if viewModel.model.gameField[number].content.id != 0 {
                                        AudioServicesPlaySystemSound(1104)
                                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                    }
                                    viewModel.swipe(number: number)
                                    viewModel.model.gameField[number].content.tap = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ) {
                                        viewModel.model.gameField[number].content.tap = false
                                    }
                                } ) // gesture
                }
            } //LazyVGrid
        }
        .aspectRatio(1/1, contentMode: .fit)
        .padding()
    }
}
