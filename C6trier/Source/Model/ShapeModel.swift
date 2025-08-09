import SwiftUI

struct Shape2DModel: ShapeModelProtocol {
    let name: String
    var color: Color
    var radius: CGFloat
    var position: SIMD2<Float>
    let shapeType: ShapeType
    
    var id: String { name }
}

struct Shape3DModel: ShapeModelProtocol {
    let name: String
    var color: Color
    var radius: CGFloat
    var position: SIMD3<Float>
    let shapeType: ShapeType
    
    var id: String { name }
}
