//
//  Sign.swift
//  RockPaperScissorsApp
//
//  Created by Salvador Garcia on 1/13/22.
//

import Foundation

func randomSign()->Sign{
    let signNumber = Int.random(in: 0...2)
    switch signNumber{
    case 0:
        return .rock
    case 1:
        return .paper
    default:
        return .scissors
    }
}

enum Sign{
    case rock
    case paper
    case scissors
    
    var emoji: String{
        switch self{
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        }
    }
    
    func compareSign(opponentSign: Sign)->GameState{

        switch (self,opponentSign){
        case (.rock, .rock),(.paper,.paper),(.scissors,.scissors):
            return .draw
        case (.rock,.scissors),(.scissors,.paper),(.paper, .rock):
            return .win
        case (.rock,.paper),(.paper,.scissors),(.scissors,.rock):
            return .lose
        }
    }
    

}


