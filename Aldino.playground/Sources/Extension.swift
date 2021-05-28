import UIKit
import AVFoundation

var soundURI: URL?
var audioPlayer = AVAudioPlayer()
var bgSoundURI: URL?
var bgAudioPlayer = AVAudioPlayer()

extension UIView{
	
	func playSound(file: String, fileExtension: String, isLoop: Bool = false){
		soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
		do {
			guard let uri = soundURI else {return}
			audioPlayer = try AVAudioPlayer(contentsOf: uri)
			audioPlayer.play()
		} catch {
			print("something went wrong")
		}
	}
	
	func playPopSound(){
		self.playSound(file: "pop", fileExtension: "wav")
	}
	
	func playBoxSound(){
		self.playSound(file: "open-box", fileExtension: "wav")
	}
	
	func playBgSound(){
		bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: "backsound", ofType: "wav")!)
		do {
			guard let uri = bgSoundURI else {return}
			bgAudioPlayer = try AVAudioPlayer(contentsOf: uri)
			bgAudioPlayer.numberOfLoops = -1
			bgAudioPlayer.play()
		} catch {
			print("something went wrong")
		}
	}
}
