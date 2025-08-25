import SwiftUI

@Observable
class ControlViewModel {
    var backgroundShape: Shape2DModel
    var musicShapes: [Shape2DModel]
    
    init() {
        // 배경 원
        self.backgroundShape = Shape2DModel(
            name: "background",
            color: Color.black.opacity(0.7),
            radius: 100,
            position: SIMD2<Float>(0, 0),
            shapeType: .circle
        )
        
        // 음악 도형들
        self.musicShapes = [
            // 중심점 표시용 작은 검은 원
            Shape2DModel(
                name: "center",
                color: .white,
                radius: 5,
                position: SIMD2<Float>(0, 0),
                shapeType: .rectangle
            ),
            Shape2DModel(
                name: "kick_1",
                color: .blue,
                radius: 5,
                position: SIMD2<Float>(-30, -60),
                shapeType: .circle
            ),
            Shape2DModel(
                name: "kick_2",
                color: .green,
                radius: 5,
                position: SIMD2<Float>(30,-60),
                shapeType: .circle
            ),
            Shape2DModel(
                name: "clap",
                color: .red,
                radius: 5,
                position: SIMD2<Float>(0, -80),
                shapeType: .circle
            ),
            Shape2DModel(
                name: "shaker",
                color: .purple,
                radius: 5,
                position: SIMD2<Float>(0, -20),
                shapeType: .circle
            ),
            Shape2DModel(
                name: "fx",
                color: .orange,
                radius: 5,
                position: SIMD2<Float>(0, -40),
                shapeType: .rectangle
            )
        ]
    }
    
    // 도형 위치 업데이트
    func updateShapePosition(shape: Shape2DModel, translation: CGSize) {
        guard let index = musicShapes.firstIndex(where: { $0.id == shape.id }) else { return }
        
        let currentX = Float(shape.position.x)
        let currentY = Float(shape.position.y)
        let deltaX = Float(translation.width)
        let deltaY = Float(translation.height)
        
        let newX = currentX + deltaX
        let newY = currentY + deltaY
        
        musicShapes[index].position = SIMD2<Float>(newX, newY)
    }
}