import RealityKit

struct LightComponent: Component, Codable {
    var intensity: Float = 1000
    var isActive: Bool = false
    var color: ColorTypes.MaterialColor
    
    static var componentName: String { "LightComponent" }
}