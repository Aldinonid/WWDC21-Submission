import Foundation
import UIKit
import PlaygroundSupport

public class Intro: UIView {
		
		var frameWidth = 500
		var frameHeight = 500
		
		let introLabel = UILabel()

		let hamsterImage = UIImageView()
		let hamster2Image = UIImageView()
		let doodleImage = UIImageView()
		let indonesiaImage = UIImageView()
		let cageIronImage = UIImageView()
		let cageImage = UIImageView()
		let processButton = UIButton()
		
		var process = 0
		
		public init(scene: UIView) {
				super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
				setupUI()
		}
		
		required init?(coder: NSCoder) {
				fatalError("init(coder:) has not been implemented")
		}
		
		func setupUI() {
				introLabel.text = "Hi guys! I'm Aldino."
				introLabel.textColor = UIColor.black
				introLabel.frame = CGRect(x: 20, y: 35, width: 500, height: 50)
				introLabel.font = UIFont.systemFont(ofSize: 20)
				introLabel.numberOfLines = 2
				introLabel.alpha = 0
				self.addSubview(introLabel)
				
				hamsterImage.image = UIImage(named: "hamster.png")
				hamsterImage.frame = CGRect(x: 500, y: 180, width: 250, height: 150)
				hamsterImage.contentMode = .scaleAspectFit
				hamsterImage.transform = CGAffineTransform(scaleX: -1, y: 1)
				hamsterImage.alpha = 1
				self.addSubview(hamsterImage)
			
				hamster2Image.image = UIImage(named: "hamster.png")
				hamster2Image.frame = CGRect(x: 550, y: 180, width: 250, height: 150)
				hamster2Image.contentMode = .scaleAspectFit
				hamster2Image.alpha = 1
				self.addSubview(hamster2Image)

				cageIronImage.image = UIImage(named: "cage-iron.png")
				cageIronImage.frame = CGRect(x: -10, y: 200, width: 238, height: 103)
				cageIronImage.contentMode = .scaleAspectFit
				cageIronImage.alpha = 0
				self.addSubview(cageIronImage)
				
				cageImage.image = UIImage(named: "cage-bedding.png")
				cageImage.frame = CGRect(x: 200, y: 200, width: 324, height: 113)
				cageImage.contentMode = .scaleAspectFit
				cageImage.alpha = 0
				self.addSubview(cageImage)
				
				processButton.setTitle("Set Up", for: .normal)
				processButton.backgroundColor = UIColor.systemTeal
				processButton.frame = CGRect(x: 350, y: 420, width: 120, height: 50)
				processButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
				processButton.layer.cornerRadius = 14.0
				processButton.alpha = 0.0
				processButton.addTarget(self, action: #selector(processButtonPressed), for: .touchUpInside)
				self.addSubview(processButton)
				processButton.isHidden = true
			
				animateInstruction()
		}
		
		func animateInstruction() {
				if(process == 0) {
						UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 1
						})
						{ (completion) in
								Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
										self.process = 1
										self.animateInstruction()
							 })
					 }
				}
				if(process == 1) {
						UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 0
						}, completion: nil)
						UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 1
								self.introLabel.text = "Today, I want to explain how to pet a hamster."
						})
						{ (completion) in
								Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (time) in
										self.process = 2
										self.animateInstruction()
								})
						}
				}
				if(process == 2) {
						UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 0
						}, completion: nil)
						UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 1
								self.introLabel.text = "Hamster is a cute animal that we used to pet."
								self.animateHamsterOnScreen()
						})
						{ (completion) in
								Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (time) in
										self.process = 3
										self.animateInstruction()
										self.animateHamsterOffScreen()
								})
						}
				}
				if(process == 3) {
						UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 0
						}, completion: nil)
						UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 1
								self.introLabel.text = "We usually use this iron cage to put the hamster"
								self.cageIronImage.alpha = 1
						})
						{ (completion) in
								Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (time) in
										self.process = 4
										self.animateInstruction()
								})
						}
				}
				if(process == 4) {
						UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 0
						}, completion: nil)
						UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 1
								self.introLabel.text = "But hamster need large cage to play \nlike it's environment."
						})
						{ (completion) in
								Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: { (time) in
										self.process = 5
										self.animateInstruction()
										
								})
						}
				}
				if(process == 5) {
						UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 0
						}, completion: nil)
						UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 1
								self.introLabel.text = "The minimun size of hamster cage is 460 SQ Inches"
						})
						{ (completion) in
								Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
										self.process = 6
										self.animateInstruction()
								})
						}
				}
				if(process == 6) {
						UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 0
						}, completion: nil)
						UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 1
								self.introLabel.text = "So aquarium cage is recommended for \nthe hamster cage, because it can be more larger"
								self.cageImage.alpha = 1
						})
						{ (completion) in
								Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { (time) in
										self.process = 7
										self.animateInstruction()
								})
						}
				}
				
				if(process == 7) {
						UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 0
								self.processButton.isHidden = false
						}, completion: nil)
						UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
								self.introLabel.alpha = 1
								self.introLabel.text = "Now let's prepare for our new hamster"
								self.processButton.alpha = 1
						})
				}
		}
		
		func animateHamsterOnScreen() {
				UIView.animate(withDuration: 1.0, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
						self.hamsterImage.frame = CGRect(x: 10, y: 180, width: 250, height: 150)
						self.hamster2Image.frame = CGRect(x: 230, y: 180, width: 250, height: 150)
				}))
		}
	
		func animateHamsterOffScreen() {
				UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: UIView.AnimationOptions.curveEaseIn, animations: ({
						self.hamsterImage.frame = CGRect(x: -300, y: 180, width: 250, height: 150)
						self.hamster2Image.frame = CGRect(x: -300, y: 180, width: 250, height: 150)
				}))
		}
		
		@objc func processButtonPressed(sender: UIButton) {
				self.removeFromSuperview()
				let cageView = Cage(scene: self)
				PlaygroundPage.current.liveView = cageView
		}
}
