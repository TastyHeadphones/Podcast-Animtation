import SwiftUI

struct MicroPhoneView: View {
    @State private var isAnimating = false
    @State private var randomOffsets = (1...10).map { _ in Double.random(in: 0.7 ... 1.3) }
    
    var body: some View {
        VStack {
            Circle()
                .fill(isAnimating ? Color.gray : Color.black)
                .scaleEffect(isAnimating ? 2 : 1, anchor: .center)
                .animation(
                    .easeInOut(duration: 2)
                    .repeatForever(autoreverses: true),
                    value: isAnimating
                )
                .frame(width: 100, height: 100)
            
            Spacer().frame(height: 120)
            
            HStack(alignment: .bottom) {
                ForEach(0..<10) { i in
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 20, height: 80)
                        .scaleEffect(x: 1, y: isAnimating ? randomOffsets[i] : 1, anchor: .bottom)
                        .animation(
                            .linear(duration: 0.2)
                            .repeatForever(autoreverses: true),
                            value: isAnimating
                        )
                }
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}
