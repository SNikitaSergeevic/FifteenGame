//
//  ContentView.swift
//  Fifteen
//
//  Created by ProstoKakTo on 26.06.2021.
//

import SwiftUI
import Neumorphic
import AVFoundation

struct NewGameView: View {
    @EnvironmentObject var viewModel: ViewModelNewGame
    @EnvironmentObject var viewModelContinueGame: ViewModelContinueGame
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {
                
                
                Spacer()
                
                Text ("Moves: \(viewModel.model.quantityMove)")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.trailing)
                    .padding(.all)
                
                FieldView(viewModel: viewModel)
                
                Spacer()
                
                Button{
                    
                } label: {Text("Shape")}
                
            }
            
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action:{
            self.presentationMode.wrappedValue.dismiss()
//            viewModel.saveGame()
            viewModel.saveGame()
            
        }){
            Text("Back menu")
                .font(.title3)
                .foregroundColor(Color.black)
        }
        )
    }
}





struct CellView: View {
    var content: Int
    //    var viewModel: ViewModel = ViewModel()
    var body: some View {
        
        ZStack {
            if content != 0 {
                RoundedRectangle(cornerRadius: 10).fill(Color.Neumorphic.main).softOuterShadow( offset: 3.5, radius: 4)
                RoundedRectangle(cornerRadius: 10).fill(Color.Neumorphic.main).softInnerShadow(RoundedRectangle(cornerRadius: 10), spread: 0.3, radius: 2 )
                Text("\(content)")
                    .foregroundColor(.black)
                    .font(.system(size: 40))
            } else {
                RoundedRectangle(cornerRadius: 10).fill(Color.Neumorphic.main).softInnerShadow(RoundedRectangle(cornerRadius: 3), spread: 0.1, radius: 1 )
            }
        }
        .aspectRatio(1/1, contentMode: .fill)
        
    }
}


struct FieldView: View {
    @ObservedObject var viewModel: ViewModelNewGame
    @State var tap = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).fill(Color.Neumorphic.main)
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
} //FieldView


// MARK: - Bogus
// - add sound on tapped
// - add much speed on tapped
// - add x/o,





//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewModel: ViewModel())
//        
//    }
//}
