import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers: View {
    var matches: [Match] = []
    var body: some View {
        HStack {
            VStack {
                Circle()
                Circle()
                    .strokeBorder(Color.primary, lineWidth: 3)
                    .aspectRatio(contentMode: .fit)
                
            }
            VStack {
                Circle()
                Circle()
                    .opacity(0)
            }
        }
    }
}

#Preview {
    CodeBreakerView()
}
