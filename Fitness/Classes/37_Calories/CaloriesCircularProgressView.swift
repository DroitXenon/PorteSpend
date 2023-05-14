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

import UIKit

//-----------------------------------------------------------------------------------------------------------------------------------------------
class CaloriesCircularProgressView: UIView {

	@IBInspectable var roundCorner: Bool = true
	@IBInspectable var progressColor: UIColor = AppColor.Theme
	@IBInspectable var trackColor: UIColor = UIColor.systemGray.withAlphaComponent(0.3)
	@IBInspectable var barWidth:CGFloat = 10.0

	private var trackLayer = CAShapeLayer()
	private var progressLayer = CAShapeLayer()

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override init(frame: CGRect) {

		super.init(frame: frame)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	required init?(coder aDecoder: NSCoder) {

		super.init(coder: aDecoder)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func draw(_ rect: CGRect) {

		let trackWidth = rect.size.width

		let center = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)
		let circleRadius = (self.frame.size.width - barWidth) / 2
		let circularPath = UIBezierPath(arcCenter: center, radius: circleRadius, startAngle: -(.pi/2), endAngle: (.pi*3)/2, clockwise: true)

		let bezierPath = UIBezierPath()
		if roundCorner {
			bezierPath.move(to: CGPoint(x: (trackWidth/2), y: rect.size.height - (trackWidth/2)))
			bezierPath.addLine(to: CGPoint(x: (trackWidth/2), y: rect.origin.y + (trackWidth/2)))
		} else {
			bezierPath.move(to: CGPoint(x: (trackWidth/2), y: rect.size.height))
			bezierPath.addLine(to: CGPoint(x: (trackWidth/2), y: rect.origin.y))
		}

		[trackLayer, progressLayer].forEach { (layer) in
			layer.path = circularPath.cgPath
			layer.fillColor = UIColor.clear.cgColor
			layer.lineWidth = barWidth
			if roundCorner {
				layer.lineCap = .round
			}
		}

		trackLayer.strokeColor = trackColor.cgColor

		progressLayer.strokeColor = progressColor.cgColor
		progressLayer.strokeEnd = 0

		layer.addSublayer(trackLayer)
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
