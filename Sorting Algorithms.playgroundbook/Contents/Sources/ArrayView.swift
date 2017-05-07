import Foundation
import UIKit

public class ArrayView: UIView{
    
    public var array: [Int] = []
    private var i,j:Int
    
    public override init(frame: CGRect) {
        i = -1
        j = -1
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        for index in 0..<array.count {
            
            if index == i || index == j {
                UIGraphicsGetCurrentContext()?.setFillColor(UIColor.yellow.cgColor)
            }else{
                UIGraphicsGetCurrentContext()?.setFillColor(UIColor.blue.cgColor)
            }
            
            let rectangle = CGRect(x: CGFloat(CGFloat(index) * self.frame.width/CGFloat(array.count) ),
                                   y: CGFloat(0),
                                   width: self.frame.width/CGFloat(array.count),
                                   height: CGFloat(array[index])*(self.frame.height)/CGFloat(array.count))
            UIGraphicsGetCurrentContext()?.fill(rectangle)
        }
        
    }
    
    public func redraw(){
        self.performSelector(onMainThread: #selector(CALayer.setNeedsDisplay), with: nil, waitUntilDone: true)
    }
    
    public func select(i: Int, j: Int){
        self.i = i;
        self.j = j;
    }
    
    public func swap(i: Int, j: Int){
        let temp = array[i]
        array[i] = array[j]
        array[j] = temp;
    }
    
    public func set(array: [Int]){
        self.array = array
    }
}
