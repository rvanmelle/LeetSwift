//: Playground - noun: a place where people can play

import UIKit
import XCPlayground
import AVFoundation

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let imgs = (1...4).flatMap { UIImage(named: "4framewalk\($0).gif") }

let imageView = UIImageView(image: imgs.first!)
XCPlaygroundPage.currentPage.liveView=imageView
imageView.animationImages = imgs
imageView.animationDuration = 1
imageView.animationRepeatCount = 0

CATransaction.begin()
CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
//imageView.layer.speed = 2

imageView.startAnimating()

CATransaction.commit()