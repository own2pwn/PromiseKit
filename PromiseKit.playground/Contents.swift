import PlaygroundSupport
import PromiseKit

func promise3() -> Promise<Int> {
    return after(.seconds(1)).map { 3 }
}

firstly {
    Promise.value(1)
}.map { _ in
    2
}.then { _ in
    promise3()
}.done {
    print($0) // => 3
}.catch { _ in
    // only happens for errors
}.finally {
    PlaygroundPage.current.finishExecution()
}

PlaygroundPage.current.needsIndefiniteExecution = true
