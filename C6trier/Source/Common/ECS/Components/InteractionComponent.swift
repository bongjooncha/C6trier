import RealityKit

struct InteractionComponent: Component, Codable {
    var isHovered: Bool = false
    var isSelected: Bool = false
    var originalColor: ColorTypes.MaterialColor
    var highlightColor: ColorTypes.MaterialColor
    
    static var componentName: String { "InteractionComponent" }
}
