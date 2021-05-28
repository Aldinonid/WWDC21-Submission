import Foundation
import UIKit
import PlaygroundSupport

public class Cage: UIView{
	
	var frameWidth = 500
	var frameHeight = 500
	
	let processLabel = UILabel()
	
	let boxHamster = UIImageView()
	
	let beddingImage = UIImageView()
	let houseImage = UIImageView()
	let wheelImage = UIImageView()
	let foodPlateImage = UIImageView()
	let drinkBottleImage = UIImageView()
	let kuaciImage = UIImageView()
	
	let cageImage = UIImageView()
	let cageBeddingImage = UIImageView()
	let cageHouseImage = UIImageView()
	let cageWheelImage = UIImageView()
	let cageFoodPlateImage = UIImageView()
	let cageDrinkImage = UIImageView()
	let cageKuaciImage = UIImageView()
	let cageHamster = UIImageView()
	
	let beddingFrame = CGRect(x: -90, y: 120, width: 342, height: 22)
	let houseFrame = CGRect(x: 150, y: 50, width: 62, height: 105)
	let wheelFrame = CGRect(x: 210, y: 50, width: 108, height: 96)
	let foodPlateFrame = CGRect(x: 320, y: 80, width: 106, height: 44)
	let drinkBottleFrame = CGRect(x: 440, y: 50, width: 50, height: 100)
	
	var isDraggingBlock = 0
	var cageProcess = 0
	var process = 0
	
	public init(scene: UIView){
		super.init(frame: CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupUI() {
		let cageList = [cageImage, cageBeddingImage, cageHouseImage, cageWheelImage, cageFoodPlateImage, cageDrinkImage, cageKuaciImage, cageHamster]
		
		processLabel.text = "Hey, we got our new hamster"
		processLabel.textColor = .black
		processLabel.frame = CGRect(x: 45, y: -220, width: frameWidth, height: frameHeight)
		processLabel.font = UIFont.systemFont(ofSize: 20)
		processLabel.numberOfLines = 2
		processLabel.alpha = 0
		self.addSubview(processLabel)
		
		boxHamster.image = UIImage(named: "box-hamster.png")
		boxHamster.frame = CGRect(x: 100, y: 100, width: 300, height: 300)
		boxHamster.contentMode = .scaleAspectFit
		boxHamster.alpha = 0
		self.addSubview(boxHamster)
		
		cageImage.image = UIImage(named: "cage.png")
		cageBeddingImage.image = UIImage(named: "cage-bedding.png")
		cageHouseImage.image = UIImage(named: "cage-house.png")
		cageWheelImage.image = UIImage(named: "cage-wheel.png")
		cageFoodPlateImage.image = UIImage(named: "cage-foodplate.png")
		cageDrinkImage.image = UIImage(named: "cage-bottle.png")
		
		for cage in cageList {
			cage.frame = CGRect(x: 60, y: 300, width: 394, height: 183)
			cage.contentMode = .scaleAspectFit
			cage.alpha = 0
			self.addSubview(cage)
		}
		
		beddingImage.image = UIImage(named: "bedding.png")
		beddingImage.frame = CGRect(x: -90, y: 120, width: 342, height: 22)
		beddingImage.contentMode = .scaleAspectFit
		beddingImage.alpha = 0
		self.addSubview(beddingImage)
		
		houseImage.image = UIImage(named: "house.png")
		houseImage.frame = CGRect(x: 150, y: 50, width: 62, height: 105)
		houseImage.contentMode = .scaleAspectFit
		houseImage.alpha = 0
		self.addSubview(houseImage)
		
		wheelImage.image = UIImage(named: "wheel.png")
		wheelImage.frame = CGRect(x: 210, y: 50, width: 108, height: 96)
		wheelImage.contentMode = .scaleAspectFit
		wheelImage.alpha = 0
		self.addSubview(wheelImage)
		
		foodPlateImage.image = UIImage(named: "food-plate.png")
		foodPlateImage.frame = CGRect(x: 320, y: 80, width: 106, height: 44)
		foodPlateImage.contentMode = .scaleAspectFit
		foodPlateImage.alpha = 0
		self.addSubview(foodPlateImage)
		
		drinkBottleImage.image = UIImage(named: "drink-bottle.png")
		drinkBottleImage.frame = CGRect(x: 440, y: 50, width: 50, height: 100)
		drinkBottleImage.contentMode = .scaleAspectFit
		drinkBottleImage.alpha = 0
		self.addSubview(drinkBottleImage)
		
		animateProcess()
	}
	
	func animateProcess(){
		if process == 0 {
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseIn, animations: {
				self.processLabel.alpha = 1
				self.boxHamster.alpha = 1
			})
			{ (completion) in
					Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
							self.process = 1
							self.animateProcess()
				 })
		 }
		}
			
		if process == 1 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
				self.boxHamster.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "But before that, we need to \nPrepare our cage for the hamster."
				self.cageImage.alpha = 1
			})
			{ (completion) in
				Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (time) in
					self.process = 2
					self.animateProcess()
				})
			}
		}
		
		if process == 2 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "First, put the bedding into cage."
				self.beddingImage.alpha = 1
				self.houseImage.alpha = 1
				self.wheelImage.alpha = 1
				self.foodPlateImage.alpha = 1
				self.drinkBottleImage.alpha = 1
			}, completion: nil)
		}
		
		if process == 3 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "Next, Put the hamster house into cage."
			}, completion: nil)
		}
		
		if process == 4 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "Nice, now let's we put the wheel \nfor the hamster toy."
			}, completion: nil)
		}
		
		if process == 5 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "Let's put the food plate into the cage"
			}, completion: nil)
		}
		
		if process == 6 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "And the last thing, put the bottle into cage"
			}, completion: nil)
		}
		
		if process == 7 {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 0
			}, completion: nil)
			UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
				self.processLabel.alpha = 1
				self.processLabel.text = "Woohooo!, we already prepared the cage"
			})
			{ (completion) in
				Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(self.nextScreen), userInfo: nil, repeats: false)
			}
		}
		
	}
	
	func animateCage() {
		
		if (cageProcess == 1) {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
				self.cageBeddingImage.alpha = 1
				self.process = 3
				self.animateProcess()
			}, completion: nil)
		}
		
		if (cageProcess == 2) {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
				self.cageHouseImage.alpha = 1
				self.process = 4
				self.animateProcess()
			}, completion: nil)
		}
		
		if (cageProcess == 3) {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
				self.cageWheelImage.alpha = 1
				self.process = 5
				self.animateProcess()
			}, completion: nil)
		}
		
		if (cageProcess == 4) {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
				self.cageFoodPlateImage.alpha = 1
				self.process = 6
				self.animateProcess()
			}, completion: nil)
		}
		
		if (cageProcess == 5) {
			UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
				self.cageDrinkImage.alpha = 1
				self.process = 7
				self.animateProcess()
			}, completion: nil)
		}
			
	}
	
	@objc func checkingMatch() {
		if beddingImage.frame.intersects(cageImage.frame) {
			self.playPopSound()
			beddingImage.alpha = 0
			beddingImage.isHidden = true
			cageProcess = 1
			animateCage()
		} else {
			beddingImage.frame = beddingFrame
		}
		
		if houseImage.frame.intersects(cageImage.frame) {
			if (beddingImage.isHidden) {
				self.playPopSound()
				houseImage.alpha = 0
				houseImage.isHidden = true
				cageProcess = 2
				animateCage()
			} else {
				houseImage.frame = houseFrame
			}
		} else {
			houseImage.frame = houseFrame
		}

		if wheelImage.frame.intersects(cageImage.frame) {
			if (beddingImage.isHidden && houseImage.isHidden) {
				self.playPopSound()
				wheelImage.alpha = 0
				wheelImage.isHidden = true
				cageProcess = 3
				animateCage()
			} else {
				wheelImage.frame = wheelFrame
			}
		} else {
			wheelImage.frame = wheelFrame
		}

		if foodPlateImage.frame.intersects(cageImage.frame) {
			if (beddingImage.isHidden && houseImage.isHidden && wheelImage.isHidden) {
				self.playPopSound()
				foodPlateImage.alpha = 0
				foodPlateImage.isHidden = true
				cageProcess = 4
				animateCage()
			} else {
				foodPlateImage.frame = foodPlateFrame
			}
		} else {
			foodPlateImage.frame = foodPlateFrame
		}

		if drinkBottleImage.frame.intersects(cageImage.frame) {
			if (beddingImage.isHidden && houseImage.isHidden && wheelImage.isHidden && foodPlateImage.isHidden) {
				self.playPopSound()
				drinkBottleImage.alpha = 0
				drinkBottleImage.isHidden = true
				cageProcess = 5
				animateCage()
			} else {
				drinkBottleImage.frame = drinkBottleFrame
			}
		} else {
			drinkBottleImage.frame = drinkBottleFrame
		}
	}
	
	public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			let location = touch.location(in: self)
			
			if drinkBottleImage.frame.contains(location){
				isDraggingBlock = 1
				drinkBottleImage.center = location
			}
			else if foodPlateImage.frame.contains(location){
				isDraggingBlock = 2
				foodPlateImage.center = location
			}
			else if wheelImage.frame.contains(location){
				isDraggingBlock = 3
				wheelImage.center = location
			}
			else if houseImage.frame.contains(location){
				isDraggingBlock = 4
				houseImage.center = location
			}
			else if beddingImage.frame.contains(location){
				isDraggingBlock = 5
				beddingImage.center = location
			}
		}
	}
	
	public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			
			let location = touch.location(in: self)
			
			if drinkBottleImage.frame.contains(location) && isDraggingBlock == 1{
				drinkBottleImage.center = location
			}
			else if foodPlateImage.frame.contains(location) && isDraggingBlock == 2{
				foodPlateImage.center = location
			}
			else if wheelImage.frame.contains(location) && isDraggingBlock == 3{
				wheelImage.center = location
			}
			else if houseImage.frame.contains(location) && isDraggingBlock == 4{
				cageProcess = 2
				houseImage.center = location
			}
			else if beddingImage.frame.contains(location) && isDraggingBlock == 5{
				beddingImage.center = location
			}
		}
	}
	
	public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.isDraggingBlock = 0
		checkingMatch()
	}
	
	@objc func nextScreen() {
		self.removeFromSuperview()
		let unboxingView = Unboxing(scene: self)
		PlaygroundPage.current.liveView = unboxingView
	}
	
}
