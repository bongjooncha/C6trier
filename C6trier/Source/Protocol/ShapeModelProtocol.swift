protocol ShapeModelProtocol: Identifiable {
    var name: String { get }
    var color: Color { get }
    var radius: CGFloat { get }
    var shapeType: ShapeType { get }
}