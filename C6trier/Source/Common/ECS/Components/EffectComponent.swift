import RealityKit
import Foundation

struct EffectComponent: Component, Codable {
    var duration: TimeInterval = 1.0
    var isActive: Bool = false
    var lightIntensity: Float = 1000
    
    static var componentName: String { "EffectComponent" }
}
