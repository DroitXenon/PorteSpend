//
// Copyright (c) 2021 Related Code - https://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class StepsCircularProgressView: UIView {

	@IBInspectable var progressColor = AppColor.Theme
	@IBInspectable var barColor = UIColor.systemGray.withAlphaComponent(0.3)
	@IBInspectable var barWidth:CGFloat = 25.0

	private var circleLayer = CAShapeLayer()
	private var progressLayer = CAShapeLayer()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override init(frame: CGRect) {

		super.init(frame: frame)
		createCircularPath()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	required init?(coder aDecoder: NSCoder) {

		super.init(coder: aDecoder)
		createCircularPath()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func createCircularPath() {

		let center = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
		let circleRadius = (self.frame.size.width - barWidth) / 2
		let circularPath = UIBezierPath(arcCenter: center, radius: circleRadius, startAngle: CGFloat(2.2), endAngle: CGFloat(7.2), clockwise: true)

		circleLayer.path = circularPath.cgPath
		circleLayer.fillColor = UIColor.clear.cgColor
		circleLayer.lineCap = .round
		circleLayer.lineWidth = barWidth
		circleLayer.strokeColor = barColor.cgColor

		progressLayer.path = circularPath.cgPath
		progressLayer.fillColor = UIColor.clear.cgColor
		progressLayer.lineCap = .round
		progressLayer.lineWidth = barWidth
		progressLayer.strokeEnd = 0
		progressLayer.strokeColor = progressColor.cgColor

		layer.addSublayer(circleLayer)
		layer.addSublayer(progressLayer)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setProgress(_ value: CGFloat, duration: TimeInterval = 1.5) {

		let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
		circularProgressAnimation.duration = duration
		circularProgressAnimation.fromValue = 0
		circularProgressAnimation.toValue = value
		circularProgressAnimation.fillMode = .forwards
		circularProgressAnimation.isRemovedOnCompletion = false
		progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
	}
}
