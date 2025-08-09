import SwiftUI

@Observable
class ControlViewModel {
    var backgroundShape: Shape2DModel
    var musicShapes: [Shape2DModel]
    
    init() {
        // 배경 원
        self.backgroundShape = Shape2DModel(
            name: "background",
            color: Color.gray.opacity(0.3),
            radius: 100,
            position: SIMD2<CGFloat>(0, 0),
            shapeType: .circle
        )
        
        // 음악 도형들
        self.musicShapes = [
            Shape2DModel(
                name: "kick_1",
                color: .blue,
                radius: 10,
                position: SIMD2<CGFloat>(-30, 60),
                shapeType: .circle
            ),
            Shape2DModel(
                name: "kick_2",
                color: .green,
                radius: 10,
                position: SIMD2<CGFloat>(30, 60),
                shapeType: .circle
            ),
            Shape2DModel(
                name: "clap",
                color: .red,
                radius: 10,
                position: SIMD2<CGFloat>(0, 80),
                shapeType: .circle
            ),
            Shape2DModel(
                name: "shaker",
                color: .purple,
                radius: 10,
                position: SIMD2<CGFloat>(0, 20),
                shapeType: .circle
            ),
            Shape2DModel(
                name: "fx",
                color: .orange,
                radius: 20,
                position: SIMD2<CGFloat>(0, 40),
                shapeType: .rectangle
            )
        ]
    }
}