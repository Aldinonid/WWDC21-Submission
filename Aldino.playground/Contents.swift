/*:
 # Let's pet a Hamster

Hamster is a animal that many people lovely to pet.

So in this playground, I want to share to you to let's pet a hamster.

*/
import UIKit
import PlaygroundSupport

var view = UIView()
var welcomeView = Welcome(scene: view)

PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = welcomeView
