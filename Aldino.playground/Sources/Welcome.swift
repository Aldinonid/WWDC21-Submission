import Foundation
import UIKit
import PlaygroundSupport

public class Welcome: UIView {
		
		var frameWidth = 500
		var frameHeight = 500

		let introLabel = UILabel()
		let startButton = UIButton()
		let hamsterImage = UIImageView()
		let doodleImage = UIImageView()
		let backgroundView = UIView()
		
		public init(scene: UIView) {
				super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
				setupUI()
		}
		
		required init?(coder: NSCoder) {
				fatalError("init(coder:) has not been implemented")
		}
		
		func setupUI() {
				introLabel.text = "Let's pet a Hamster"
				introLabel.textColor = UIColor.black
				introLabel.frame = CGRect(x: 135, y: -180, width: frameWidth, height: frameHeight)
				introLabel.font = UIFont.systemFont(ofSize: 28)
				self.addSubview(introLabel)
				
				startButton.setTitle("Start", for: .normal)
				startButton.backgroundColor = UIColor.lightGray
				startButton.frame = CGRect(x: 150, y: 180, width: 200, height: 100)
				startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
				startButton.layer.cornerRadius = 14.0
				startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
				self.addSubview(startButton)
				
				hamsterImage.image = UIImage(named: "cage-hamster.png")
				hamsterImage.frame = CGRect(x: 60, y: 300, width: 394, height: 183)
				hamsterImage.contentMode = .scaleAspectFit
				hamsterImage.alpha = 1
				self.addSubview(hamsterImage)
		}
		@objc func startButtonPressed(sender: UIButton) {
				nextScreen()
		}

		func nextScreen() {
				self.playBgSound()
				self.removeFromSuperview()
				let introView = Intro(scene: self)
				PlaygroundPage.current.liveView = introView
		}
}
