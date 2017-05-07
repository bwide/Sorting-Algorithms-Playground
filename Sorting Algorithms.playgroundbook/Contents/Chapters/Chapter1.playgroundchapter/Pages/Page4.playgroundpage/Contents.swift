//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code

let size = /*#-editable-code size of the array*/100/*#-end-editable-code*/

/*:
 Here you can create and test your own algorithms.
 This are the funcions and properties you can use:
  * size - size of the array you are sorting
  * elementAt(index: Int) - returns the element of the array at index
  * select(i: Int, j: Int) - used for painting the rectangles yellow
  * compare(i: Int, j: Int) - compares both i and j and returns:
 
  1 if i >= j
 
  0 if i == j
 
 -1 if i <= j
 
  * swap(i: Int, j: Int) - swaps element i with j
  * compareAndSwap(i: Int, j: Int) - select and compares both elements and if i > j, swaps them
 */

//#-hidden-code
public let array = VisualSortableArray.init(arraySize: size)

public func elementAt(index: Int) -> Int {
    return array.get(index: index)
}

public func compare(i: Int, j: Int) -> Int{
    return array.compare(i: i, j: j)
}

public func swap(i: Int, j: Int) -> Bool {
    return array.swap(i: i, j: j)
}

public func select(i: Int, j: Int) -> Bool {
    return array.select(i: i, j: j)
}

PlaygroundPage.current.liveView = array.view

DispatchQueue.global(qos: .background).async {
    sleep(2)
//#-end-hidden-code
    
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(keyword, show, for, while)
//#-editable-code
    

//#-end-editable-code
//#-hidden-code
}
//#-end-hidden-code
