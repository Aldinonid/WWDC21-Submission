import Foundation
import UIKit
import PlaygroundSupport

public class Unboxing: UIView{
	
	var frameWidth = 500
	var frameHeight = 500
	
	var unboxingLabel = UILabel()
	var openLabel = UILabel()
	var boxHamsterImage = UIImageView()
	var unboxHamsterImage = UIImageView()
	var hamsterImage = UIImageView()
	var unboxingButton = UIButton()
	
	var process = 0
	
	public init(scene: UIView){
		super.init(frame: CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupUI(){
		
		unboxingLabel.text = "Let's unbox our new hamster"
		unboxingLabel.frame = CGRect(x: 45, y: -220, width: frameWidth, height: frameHeight)
		unboxingLabel.font = UIFont.systemFont(ofSize: 20)
		self.addSubview(unboxingLabel)
		
		openLabel.text = "👆 \nClick the box to open"
		openLabel.frame = CGRect(x: 0, y: 190, width: frameWidth, height: frameHeight)
		openLabel.font = UIFont.systemFont(ofSize: 28)
		openLabel.numberOfLines = 2
		openLabel.textAlignment = .center
		openLabel.alpha = 0
		self.addSubview(openLabel)
		
		unboxHamsterImage.image = UIImage(named: "unbox-hamster.png")
		unboxHamsterImage.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
		unboxHamsterImage.contentMode = .scaleAspectFit
		unboxHamsterImage.alpha = 0
		self.addSubview(unboxHamsterImage)
		
		hamsterImage.image = UIImage(named: "hamster.png")
		hamsterImage.frame = CGRect(x: 130, y: 200, width: 238, height: 139)
		hamsterImage.contentMode = .scaleAspectFit
		hamsterImage.alpha = 0
		self.addSubview(hamsterImage)
		
		boxHamsterImage.image = UIImage(named: "box-hamster.png")
		boxHamsterImage.frame = CGRect(x: 500, y: 185, width: 210, height: 210)
		boxHamsterImage.contentMode = .scaleAspectFit
		boxHamsterImage.alpha = 1
		self.addSubview(boxHamsterImage)
		
		unboxingButton.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
		unboxingButton.addTarget(self, action: #selector(unboxingButtonPressed), for: .touchUpInside)
		self.addSubview(unboxingButton)
		
		animateProcess()
	}
	
	func animateProcess() {
		if process == 0 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.unboxingLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.unboxingLabel.alpha = 1
				self.unboxingLabel.text = "Let's open the hamster box"
				self.animateBoxOnScreen()
				self.openLabel.alpha = 1
			}, completion: nil)
		}
		
		if process == 1 {
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.unboxingLabel.alpha = 0
				self.openLabel.alpha = 0
				self.boxHamsterImage.alpha = 0
				self.unboxHamsterImage.alpha = 0
				self.unboxingButton.isHidden = true
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
				self.hamsterImage.frame = CGRect(x: 130, y: 200, width: 238, height: 139)
				self.unboxingLabel.alpha = 1
				self.unboxingLabel.text = "Now let's put our hamster into the cage"
			}) { (completion) in
				Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { (time) in
					self.nextScreen()
				})
			}
		}
	}
	
	func animateBoxOnScreen() {
			UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
					self.boxHamsterImage.frame = CGRect(x: 146, y: 185, width: 210, height: 210)
			}))
	}
	
	@objc func unboxingButtonPressed(){
		UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
			self.playBoxSound()
			self.unboxHamsterImage.alpha = 1
			self.hamsterImage.alpha = 1
			self.hamsterImage.frame = CGRect(x: 130, y: 50, width: 238, height: 139)
			self.process = 1
			self.animateProcess()
		}, completion: nil)
	}
	
	func nextScreen(){
		self.removeFromSuperview()
		let hamsterView = Hamster(scene: self)
		PlaygroundPage.current.liveView = hamsterView
	}
}
