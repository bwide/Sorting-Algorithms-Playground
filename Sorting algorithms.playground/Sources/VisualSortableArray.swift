
import Foundation
import CoreGraphics
import UIKit

public class  VisualSortableArray{
    
    public var view:ArrayView
    public var count:Int
    
    public init(arraySize: Int) {
        count = arraySize;
        var rectangles = [Int]()
        
        for index in 1...arraySize {
            rectangles.append(index)
        }

        view = ArrayView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
        view.set(array: rectangles)
        view.backgroundColor = UIColor.white
        
        
        shuffle()
    }
    
    public func get(index: Int) -> Int{
        return view.array[index]
    }
    
    public func compareAndSwap(i: Int, j: Int) -> Bool{
        select(i: i, j: j)
        if compare(i: i, j: j) > 0 {
            swap(i: i, j: j)
            return true
        }else{
            return false
        }
    }
    
    public func compare(i: Int, j: Int) -> Int {
        if view.array[i] > view.array[j] {
            return 1
        }
        else if view.array[i] < view.array[j] {
            return -1
        }
        else{
            return 0
        }
    }
    

//     these two methods return a boolean.
//     at first they were returning void (as they should) but this caused them to allocate massive amounts of memory
//     and crash on the ipad
    
     public func swap(i: Int, j: Int){ //this method seems to leak memory
        view.swap(i: i, j: j)
        view.redraw()
     }
//
//     same happened to the select(i: Int , j: Int) method
//     
//     I don't really know what may be causing this, but consider this a bug report

    
//    public func swap(i: Int, j: Int) -> Bool{
//        view.swap(i: i, j: j)
//        view.redraw()
//        return true
//    }
    
    public func select(i: Int, j: Int) -> Bool{
        view.select(i: i, j: j)
        view.redraw()
        return true
    }
    
    private func shuffle(){
        var index = [Int]()
        
        for i in 0..<count{
            index.append(i)
        }
        
        for i in 0..<index.count {
            
            let key = Int(arc4random_uniform(UInt32(index.count)))
            let randomIndex = index[key]
            index.remove(at: key)
            
            swap(i: i, j: randomIndex)
        }
    }
}
