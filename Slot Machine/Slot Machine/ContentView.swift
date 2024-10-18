//
//  ContentView.swift
//  Slot Machine
//
//  Created by Singgih Aji Sasongko on 18/10/24.
//

import SwiftUI

struct ContentView: View {
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    
    @State private var highscore: Int = 0
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var reels: Array = [0, 1, 2]
    @State private var showingInfoView: Bool = false
    @State private var isActiveBet10: Bool = true
    @State private var isActiveBet20: Bool = false
    // MARK: - FUNCTIONS
    func spinReels(){
        reels = reels.map({ _ in
            Int.random(in: 0...symbols.count - 1)
        })
    }
    
    func checkWining() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
            playerWins()
            
            if coins > highscore {
                newHighScore()
            }
        } else {
            playerLoses()
        }
    }
    
    func playerWins() {
        coins += betAmount * 10
    }
    
    func newHighScore() {
        highscore = coins
    }
    
    func playerLoses() {
        coins -= betAmount
    }
    
    func activeBet20() {
        betAmount = 20
        isActiveBet20 = true
        isActiveBet10 = false
    }
    
    func activeBet10() {
        betAmount = 10
        isActiveBet20 = false
        isActiveBet10 = true
    }
    
    
    var body: some View {
        ZStack {
            // MARK: - Background
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"),Color("ColorPurple")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5) {
                // MARK: - Header
                LogoView()
                
                Spacer()
                
                // MARK: - Score
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highscore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                // MARK: - Slot Machine
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
                    // MARK: - Reel #1
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0){
                        // MARK: - Reel #2
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        
                        Spacer()
                        // MARK: - Reel #3
                        
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    // MARK: - Spin Button
                    Button(action: {
                        self.spinReels()
                        self.checkWining()
                    }, label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    })
                }
                .layoutPriority(2)
                
                // MARK: - Footer
                
                Spacer()
                
                HStack {
                    // MARK: - Bet 20
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                        Button(action: {
                            self.activeBet20()
                        }, label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet20 ? Color.yellow : Color.white)
                                .modifier(BetNumberModifier())
                        })
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .modifier(CasinoChipsModifier())
                    }
                    //MARK: - Bet 10
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .modifier(CasinoChipsModifier())
                        Button(action: {
                            self.activeBet10()
                        }, label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet10 ? Color.yellow : Color.white)
                                .modifier(BetNumberModifier())
                        })
                        .modifier(BetCapsuleModifier())
                        
                    }
                }
                
            }
            // MARK: - Buttons
            .overlay(
                //reset
                Button(action: {
                    self.showingInfoView = true
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .modifier(ButtonModifier()),
                alignment: .topLeading
            )
            .overlay(
                //reset
                Button(action: {
                    print("Info view")
                }, label: {
                    Image(systemName: "info.circle")
                })
                .modifier(ButtonModifier()),
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            
            //MARK: - Popup
        }
        .sheet(isPresented: $showingInfoView, content: {
            InfoView()
        })
    }
}

#Preview {
    ContentView()
}
