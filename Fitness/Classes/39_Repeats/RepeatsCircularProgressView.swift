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
class RepeatsCircularProgressView: UIView {

	@IBInspectable var roundCorner: Bool = true
	@IBInspectable var progressColor: UIColor = AppColor.Theme
	@IBInspectable var trackColor: UIColor = UIColor.systemGray.withAlphaComponent(0.3)
	@IBInspectable var barWidth:CGFloat = 35.0
	@IBInspectable var progress:CGFloat = 0.0

	private var trackLayer = CAShapeLayer()
	private var progressLayer = CAShapeLayer()
	private var handleLayer = CAShapeLayer()

	private var circleCenter:CGPoint {
		get { return CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0) }
	}
	private var circleRadius:CGFloat {
		get { return (self.frame.size.width - barWidth) / 2 }
	}
	private var handleWidth:CGFloat {
		get { return barWidth - 10 }
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func draw(_ rect: CGRect) {

		let trackWidth = rect.size.width

		let circularPath = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: -(.pi/2), endAngle: (.pi*3)/2, clockwise: true)

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
		handleLayer.backgroundColor = UIColor.white.cgColor
		handleLayer.cornerRadius = handleWidth/2
		layer.addSublayer(trackLayer)
		layer.addSublayer(progressLayer)
		layer.addSublayer(handleLayer)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func point(progress: Double, radius: CGFloat) -> CGPoint {

		let x = radius * (1 + CGFloat(sin(progress * 2 * Double.pi)))
		let y = radius * (1 - CGFloat(cos(progress * 2 * Double.pi)))
		return CGPoint(x: x, y: y)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setProgress(_ value: CGFloat, duration: TimeInterval = 1.5) {

		let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
		circularProgressAnimation.duration = duration
		circularProgressAnimation.fromValue = progress
		circularProgressAnimation.toValue = value
		circularProgressAnimation.fillMode = .forwards
		circularProgressAnimation.isRemovedOnCompletion = false
		progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
		progress = value

		let point = self.point(progress: Double(progress), radius: circleRadius)
		handleLayer.frame = CGRect(x: point.x + 5, y: point.y + 5, width: barWidth - 10, height: barWidth - 10)

		let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: -(.pi/2), endAngle: .pi/2, clockwise: true)
		let circularProgressAnimation1 = CAKeyframeAnimation(keyPath: "position")
		circularProgressAnimation1.duration = duration
		circularProgressAnimation1.path = path.cgPath
		handleLayer.add(circularProgressAnimation1, forKey: "handleAnim")
	}
}
