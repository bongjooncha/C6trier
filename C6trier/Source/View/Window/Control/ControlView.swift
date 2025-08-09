import SwiftUI

struct ControlView: View {
    @State private var viewModel = ControlViewModel()
    
    var body: some View {
        ZStack {
            // 배경 원
            if viewModel.backgroundShape.shapeType == .circle {
                Circle()
                    .fill(viewModel.backgroundShape.color)
                    .frame(width: viewModel.backgroundShape.radius * 2,
                           height: viewModel.backgroundShape.radius * 2)
            }
            
            // 음악 도형들
            ForEach(viewModel.musicShapes) { shape in
                Group {
                    switch shape.shapeType {
                    case .circle:
                        Circle()
                            .fill(shape.color)
                    case .rectangle:
                        Rectangle()
                            .fill(shape.color)
                    }
                }
                .frame(width: shape.radius * 2, height: shape.radius * 2)
                .position(x: shape.position.x + viewModel.backgroundShape.radius,
                         y: shape.position.y + viewModel.backgroundShape.radius)
                // ... 제스처 핸들러 등
            }
        }
    }
}