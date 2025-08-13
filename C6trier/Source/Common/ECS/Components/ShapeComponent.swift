import RealityKit

struct ShapeComponent: Component, Codable {
    var name: String
    var color: ColorType.MaterialColor
    var position: SIMD3<Float>
    var size: Float

    static var componentName: String { "ShapeComponent" }
}
