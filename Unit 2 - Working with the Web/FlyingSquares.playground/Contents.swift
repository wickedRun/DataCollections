import UIKit
import PlaygroundSupport

let liveViewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
let liveView = UIView(frame: liveViewFrame)
liveView.backgroundColor = .white

PlaygroundPage.current.liveView = liveView

let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor = .purple
liveView.addSubview(square)

// 이렇게 같이 애니메이션을 동작하면 이상하게 동작하는데 그 이유는 서로 같이 동작하기 때문에 해결하기 위해서는 completion을 사용해야한다.
//UIView.animate(withDuration: 3.0) {
//    square.backgroundColor = .orange
//    let x = liveView.frame.width / 2
//    let y = liveView.frame.height / 2
//    square.frame.size = CGSize(width: 300, height: 300)
//    square.center = CGPoint(x: x, y: y)
//}
//
//UIView.animate(withDuration: 3.0) {
//    square.backgroundColor = .purple
//    square.frame = CGRect(x: 0, y: 0, width: 100, height:  100)
//}

// completion 파라미터를 사용한 animate
//UIView.animate(withDuration: 3.0, animations: {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 150, y: 150, width: 200, height: 200)
//}, completion: { (_) in // --> comepletion 인수는 (Bool) -> Void?
//    UIView.animate(withDuration: 3.0) {
//        square.backgroundColor = .purple
//        square.frame = smallFrame
//    }
//})

// 옵션도 가능.
//UIView.animate(withDuration: 3.0, delay: 2.0, options: [.repeat], animations: {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 400, y: 400, width: 100, height: 100)
//}, completion: nil)
//

// 바운시 느낌.
UIView.animate(withDuration: 1.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: [], animations: {
    square.frame = CGRect(x: 150, y: 150, width: 200, height: 200)
}, completion: nil)

