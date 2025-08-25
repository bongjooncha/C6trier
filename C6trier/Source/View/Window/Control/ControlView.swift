import SwiftUI

struct ControlView: View {
    @Environment(AppModel.self) var appModel
    private var viewModel: ControlViewModel { appModel.controlVM }
    
    var body: some View {
        ZStack {
            // 배경 원을 별도의 뷰로 분 리
            BackgroundShapeView(shape: viewModel.backgroundShape)
            
            // 음악 도형들을 별도의 뷰로 분리
            MusicShapesView(viewModel: viewModel,
                          backgroundRadius: viewModel.backgroundShape.radius)
        }
        .frame(width: viewModel.backgroundShape.radius * 2,
               height: viewModel.backgroundShape.radius * 2)
    }
}

// 배경 도형을 위한 하위 뷰
private struct BackgroundShapeView: View {
    let shape: Shape2DModel
    
    var body: some View {
        if shape.shapeType == .circle {
            Circle()
                .fill(shape.color)
                .frame(width: shape.radius * 2,
                       height: shape.radius * 2)
        }
    }
}


#Preview {
    ControlView()
        .environment(AppModel())
}
