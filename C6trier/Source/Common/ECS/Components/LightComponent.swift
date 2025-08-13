import RealityKit

struct LightComponent: Component, Codable {
    var intensity: Float = 1000
    var isActive: Bool = false
    var color: ColorType.MaterialColor
    
    static var componentName: String { "LightComponent" }
}
