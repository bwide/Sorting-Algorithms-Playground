//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code

let arraySize = /*#-editable-code*/50/*#-end-editable-code*/

//#-hidden-code
let array = VisualSortableArray.init(arraySize: arraySize)

func compareAndSwap(i: Int, j: Int) -> Bool{
    return array.compareAndSwap(i: i, j: j)
}

PlaygroundPage.current.liveView = array.view

DispatchQueue.global(qos: .background).async {
    sleep(2)
    //#-end-hidden-code
    
/*:
 This second algorithm is called Insertion Sort
     
 Try to run it step by step and see what it does
 */
    
for i in 1..<array.count {
    for j in (1...i).reversed() {//this will go from i to 1
        compareAndSwap(i: j-1, j: j)
    }
}
    
    //#-hidden-code
}
//#-end-hidden-code
