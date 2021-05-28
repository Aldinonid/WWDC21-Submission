import Foundation
import UIKit
import PlaygroundSupport

public class Hamster: UIView {
	var frameWidth = 500
	var frameHeight = 500
	
	var processLabel = UILabel()
	var cageImage = UIImageView()
	var cageKuaciImage = UIImageView()
	var cageHamsterImage = UIImageView()
	var hamsterImage = UIImageView()
	var kuaciImage = UIImageView()
	
	var sunImage = UIImageView()
	var cageNoBeddingImage = UIImageView()
	var beddingImage = UIImageView()
	
	var hamsterFrame = CGRect(x: 150, y: 60, width: 70, height: 70)
	let kuaciFrame = CGRect(x: 30, y: 50, width: 100, height: 100)
	
	var process = 0
	var isDragMove = 0
	var cageProcess = 0
	
	public init(scene: UIView){
		super.init(frame: CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupUI(){
		let cageList = [cageImage, cageKuaciImage, cageHamsterImage, cageNoBeddingImage]
		processLabel.text = "Put the food into the cage"
		processLabel.frame = CGRect(x: 45, y: -220, width: frameWidth, height: frameHeight)
		processLabel.font = UIFont.systemFont(ofSize: 20)
		processLabel.numberOfLines = 2
		self.addSubview(processLabel)
		
		cageImage.image = UIImage(named: "cage-bottle.png")
		cageKuaciImage.image = UIImage(named: "cage-kuaci.png")
		cageHamsterImage.image = UIImage(named: "cage-hamster.png")
		cageNoBeddingImage.image = UIImage(named: "cage-no-bedding.png")
		
		beddingImage.image = UIImage(named: "bedding.png")
		beddingImage.frame = CGRect(x: 50, y: 230, width: 392, height: 72)
		beddingImage.contentMode = .scaleAspectFit
		beddingImage.alpha = 0
		self.addSubview(beddingImage)
		
		for cage in cageList {
			cage.frame = CGRect(x: 60, y: 300, width: 394, height: 183)
			cage.contentMode = .scaleAspectFit
			cage.alpha = 0
			self.addSubview(cage)
		}
		
		cageNoBeddingImage.frame = CGRect(x: 3.5, y: 200, width: 494, height: 283)
		
		cageImage.alpha = 1
		
		hamsterImage.image = UIImage(named: "hamster.png")
		hamsterImage.frame = CGRect(x: 150, y: 60, width: 70, height: 70)
		hamsterImage.contentMode = .scaleAspectFit
		self.addSubview(hamsterImage)
		
		kuaciImage.image = UIImage(named: "kuaci.png")
		kuaciImage.frame = CGRect(x: 30, y: 50, width: 100, height: 100)
		kuaciImage.contentMode = .scaleAspectFit
		self.addSubview(kuaciImage)
		
		sunImage.image = UIImage(named: "no-sun.png")
		sunImage.frame = CGRect(x: 250, y: 100, width: 100, height: 100)
		sunImage.contentMode = .scaleAspectFit
		sunImage.alpha = 0
		self.addSubview(sunImage)
	}
	
	func processAnimate(){
		if process == 1 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "Finally, let's put the hamster into the cage"
			}, completion: nil)
		}
		
		if process == 2 {
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
				self.cageImage.alpha = 0
				self.cageKuaciImage.alpha = 0
				self.cageHamsterImage.frame = CGRect(x: 3.5, y: 200, width: 494, height: 283)
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 1.0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "Woohoo, We're done 🥳"
			}) { (completion) in
				Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: {(time) in
					self.process = 3
					self.processAnimate()
				})
			}
		}
		
		if process == 3 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "As we know, hamster is a nocturnal animal \nSo they will more active in night"
			}) { (completion) in
				Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: {(time) in
					self.process = 4
					self.processAnimate()
				})
			}
		}
		
		if process == 4 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "Don't put hamster in place direct to sun"
				self.sunImage.alpha = 1
			}) { (completion) in
				Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: {(time) in
					self.process = 5
					self.processAnimate()
				})
			}
		}
		
		if process == 5 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
				self.beddingImage.alpha = 1
				self.sunImage.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "We should change the bedding every 1 or 2 month"
				self.beddingImage.frame = CGRect(x: 50, y: 130, width: 392, height: 72)
				self.cageNoBeddingImage.alpha = 1
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
				self.beddingImage.frame = CGRect(x: 50, y: 230, width: 392, height: 72)
				self.cageNoBeddingImage.alpha = 0
			})
			{ (completion) in
				Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: {(time) in
					self.process = 6
					self.processAnimate()
				})
			}
		}
		
		if process == 6 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "Ok, that's all for today \nThank you for your attention."
			}, completion: nil)
		}
	}
	
	func cageAnimate(){
		if cageProcess == 1 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.cageKuaciImage.alpha = 1
				self.process = 1
				self.processAnimate()
			}, completion: nil)
		}
		
		if cageProcess == 2 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.cageHamsterImage.alpha = 1
				self.process = 2
				self.processAnimate()
			}, completion: nil)
		}
	}
	
	@objc func checkingMatch() {
		
		if (kuaciImage.frame.intersects(cageImage.frame)){
			self.playPopSound()
			kuaciImage.alpha = 0
			kuaciImage.isHidden = true
			cageProcess = 1
			cageAnimate()
		} else {
			kuaciImage.frame = kuaciFrame
		}
		
		if (hamsterImage.frame.intersects(cageImage.frame) && kuaciImage.isHidden){
			self.playPopSound()
			hamsterImage.alpha = 0
			hamsterImage.isHidden = true
			cageProcess = 2
			cageAnimate()
		} else {
			hamsterImage.frame = hamsterFrame
		}
	}
	
	public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			let location = touch.location(in: self)
			
			if kuaciImage.frame.contains(location){
				isDragMove = 1
				kuaciImage.center = location
			}
			
			if hamsterImage.frame.contains(location){
				isDragMove = 2
				hamsterImage.center = location
			}
			
		}
	}
	
	public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			let location = touch.location(in: self)
			
			if (hamsterImage.frame.contains(location) && isDragMove == 2) {
				hamsterImage.center = location
			}
			
			if (kuaciImage.frame.contains(location) && isDragMove == 1) {
				kuaciImage.center = location
			}
		}
	}
	
		public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		isDragMove = 0
		checkingMatch()
	}
	
}
