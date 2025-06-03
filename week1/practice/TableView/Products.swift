import UIKit

enum Products  {
    case vitamin
    case cleanUp
    case perfume
    case watch
    case bag
    case headPhone
    case lipStick
    case camera
    case lotion
    case shoes
    case plant
    
    var image: UIImage {
        switch self {
        case .vitamin :
            return UIImage(named: "product1")!
        case .cleanUp :
            return UIImage(named: "product2")!
        case .perfume :
            return UIImage(named: "product3")!
        case .watch :
            return UIImage(named: "product4")!
        case .bag :
            return UIImage(named: "product5")!
        case .headPhone :
            return UIImage(named: "product6")!
        case .lipStick :
            return UIImage(named: "product7")!
        case .camera :
            return UIImage(named: "product8")!
        case .lotion :
            return UIImage(named: "product9")!
        case .shoes :
            return UIImage(named: "product10")!
        case .plant :
            return UIImage(named: "product11")!
        }
    }
}
