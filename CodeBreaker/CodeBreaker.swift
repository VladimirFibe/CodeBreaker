import SwiftUI

typealias Peg = Color

struct Code {
    var kind: Kind
    var pegs: [Peg] = [.red, .green, .blue, .yellow]
    
    enum Kind {
        case master
        case guess
        case attempt
        case unkonwn
    }
    
    static let missing: Peg = .clear
}

struct CodeBreaker {
    var masterCode = Code(kind: .master)
    var guess = Code(kind: .guess)
    var attempts: [Code] = [Code(kind: .attempt, pegs: [.red, .yellow, .yellow, .green])]
    var pegChoices: [Peg] = [.red, .green, .blue, .yellow]
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExistingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPeg = pegChoices[(indexOfExistingPegInPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missing
        }
    }
    
    mutating func attemptGuess() {
        var attempt = guess
        attempt.kind = .attempt
        attempts.append(attempt)
    }
}
