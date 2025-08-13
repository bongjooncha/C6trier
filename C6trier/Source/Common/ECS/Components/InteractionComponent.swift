import RealityKit

struct InteractionComponent: Component, Codable {
    var isHovered: Bool = false
    var isSelected: Bool = false
    var originalColor: ColorType.MaterialColor
    var highlightColor: ColorType.MaterialColor
    
    static var componentName: String { "InteractionComponent" }
}
