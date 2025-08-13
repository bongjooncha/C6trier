import SwiftUI


// 음악 도형들을 위한 하위 뷰
struct MusicShapesView: View {
    @State var viewModel: ControlViewModel
    let backgroundRadius: CGFloat
    
    var body: some View {
        ForEach(viewModel.musicShapes) { shape in
            ShapeView(shape: shape,
                    backgroundRadius: backgroundRadius,
                    onDrag: { translation in
                viewModel.updateShapePosition(shape: shape, translation: translation)
            })
        }
    }
}

// 개별 도형을 위한 하위 뷰
private struct ShapeView: View {
    let shape: Shape2DModel
    let backgroundRadius: CGFloat
    let onDrag: (CGSize) -> Void
    
    var body: some View {
        Group {
            switch shape.shapeType {
            case .circle:
                Circle()
                    .fill(shape.color)
                    .hoverEffect(.highlight)
                    .help(shape.name)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                onDrag(value.translation)
                            }
                    )
            case .rectangle:
                Rectangle()
                    .fill(shape.color)
                    .hoverEffect(.highlight)
                    .help(shape.name)
            }
        }
        .frame(width: shape.radius * 2, height: shape.radius * 2)
        .position(x: CGFloat(shape.position.x) + backgroundRadius,
                 y: CGFloat(shape.position.y) + backgroundRadius)
    }
}
