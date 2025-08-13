import SwiftUI
import RealityKit

struct ColorType {
    struct MaterialColor: Codable {
        var red: Float
        var green: Float
        var blue: Float
        var alpha: Float
        
        // SwiftUI.Color로부터 생성
        init(color: SwiftUI.Color) {
            let uiColor = UIColor(color)
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            self.red = Float(red)
            self.green = Float(green)
            self.blue = Float(blue)
            self.alpha = Float(alpha)
        }
        
//        var toMaterialColor: RealityKit.Material.BaseColor {
//            RealityKit.Material.BaseColor(
//                tint: UIColor(
//                    red: CGFloat(red),
//                    green: CGFloat(green),
//                    blue: CGFloat(blue),
//                    alpha: CGFloat(alpha)
//                )
//            )
//        }
    }
}
