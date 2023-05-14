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
import QuartzCore
import Foundation

//-----------------------------------------------------------------------------------------------------------------------------------------------
class RangeSlider: UIControl{

	private var leftHandleLayer: CALayer!
	private var rightHandleLayer: CALayer!
	private var normalbackImageView: UIImageView!
	private var highlightedImageView: UIImageView!
	private var leftTextLayer: CATextLayer!
	private var rightTextLayer: CATextLayer!

	private var insideMax: Int = 1000
	private var insideMin: Int = 0
	private var leftValue: Int = 0
	private var rightValue: Int = 0
	private var insideAccuracy: Int = 1

	private var previouslocation = CGPoint.zero

	private var isLeftSelected = false
	private var isRightSelected = false

	var valueChangeClosure: ((_ minValue: Int, _ maxValue: Int) -> ())?

	private var barHeight: CGFloat = 4
	private var barWidth: CGFloat = 0
	private var handleWidth: CGFloat = 25
	private var handleHeight: CGFloat = 25

	var textColor: UIColor = UIColor.label
	var handleColor: UIColor = UIColor.white
	var normalBackgroundColor: UIColor = UIColor.systemGray5
	var highlightedBackgroundColor: UIColor = AppColor.Theme

	var stringPrefix = "" {
		didSet {
			self.setLabelText()
		}
	}

	var textAttributes: [NSAttributedString.Key: Any]? = nil {
		didSet {
			self.setLabelText()
		}
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override init(frame: CGRect) {

		super.init(frame: frame)
		setInitValue()

		normalbackImageView = UIImageView()
		addSubview(normalbackImageView)

		highlightedImageView = UIImageView()
		addSubview(highlightedImageView)

		leftHandleLayer = createHandleLayer()
		layer.addSublayer(leftHandleLayer)

		rightHandleLayer = createHandleLayer()
		layer.addSublayer(rightHandleLayer)

		leftTextLayer = createTextLayer()
		layer.addSublayer(leftTextLayer)

		rightTextLayer = createTextLayer()
		layer.addSublayer(rightTextLayer)

		updateUI()
		setLabelText()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {

		super.traitCollectionDidChange(previousTraitCollection)
		normalbackImageView.backgroundColor = normalBackgroundColor
		highlightedImageView.backgroundColor = highlightedBackgroundColor

		leftHandleLayer.backgroundColor = handleColor.cgColor
		leftTextLayer.foregroundColor = textColor.cgColor

		rightHandleLayer.backgroundColor = handleColor.cgColor
		rightTextLayer.foregroundColor = textColor.cgColor
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func updateUI() {

		barWidth = frame.width - 2 * handleWidth
		normalbackImageView.layer.cornerRadius = 4
		normalbackImageView.backgroundColor = normalBackgroundColor
		normalbackImageView.frame = CGRect(x: handleWidth * 0.5, y: 0.5 * (frame.height - barHeight), width: frame.width - handleWidth, height: barHeight)

		highlightedImageView.backgroundColor = highlightedBackgroundColor
		highlightedImageView.frame = CGRect(x: handleWidth * 0.5, y: 0.5 * (frame.height - barHeight), width: frame.width - handleWidth, height: barHeight)

		leftHandleLayer.frame = CGRect(x: 0, y: 0.5 * (frame.height - handleHeight), width: handleWidth, height: handleHeight)
		rightHandleLayer.frame = CGRect(x: frame.width - handleWidth, y: leftHandleLayer.frame.minY, width: handleWidth, height: handleHeight)

		let kTextWidth: CGFloat = 50
		let kTextHeight: CGFloat = 20
		leftTextLayer.frame = CGRect(x: leftHandleLayer.frame.minX - 0.5 * (kTextWidth - leftHandleLayer.frame.width), y: leftHandleLayer.frame.minY - kTextHeight, width: kTextWidth, height: kTextHeight)

		rightTextLayer.frame = CGRect(x: rightHandleLayer.frame.minX - 0.5 * (kTextWidth - leftHandleLayer.frame.width), y: leftTextLayer.frame.minY, width: kTextWidth, height: kTextHeight)

		setCurrentValue(left: leftValue/insideAccuracy * insideAccuracy, right: rightValue/insideAccuracy * insideAccuracy)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	required init?(coder aDecoder: NSCoder) {

		fatalError("init(coder:) has not been implemented")
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setRange(minRange: Int, maxRange: Int, accuracy: Int) {

		assert(maxRange >= minRange, "maxRange = \(maxRange) less than minRange = \(minRange)")
		insideMax = maxRange
		insideMin = minRange
		insideAccuracy = accuracy
		setInitValue()
		setLabelText()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	func setCurrentValue(left: Int, right: Int) {

		if left >= right{
			return
		}
		leftValue = max(insideMin,left)
		leftValue = min(insideMax,leftValue)

		rightValue = max(right,insideMin)
		rightValue = min(rightValue,insideMax)

		let range = insideMax - insideMin
		let leftX = CGFloat(leftValue - insideMin)/CGFloat(range)
		let rightX = CGFloat(rightValue - insideMin)/CGFloat(range)

		leftHandleLayer.frame = CGRect(x: leftX * barWidth, y: 0.5 * (frame.height - handleHeight), width: handleWidth, height: handleHeight)
		rightHandleLayer.frame = CGRect(x: rightX * barWidth + leftHandleLayer.frame.width, y: leftHandleLayer.frame.minY, width: handleWidth, height: handleHeight)

		let kTextWidth: CGFloat = 50
		let kTextHeight: CGFloat = 20
		leftTextLayer.frame = CGRect(x: leftHandleLayer.frame.minX - 0.5 * (kTextWidth - leftHandleLayer.frame.width), y: leftHandleLayer.frame.minY - kTextHeight, width: kTextWidth, height: kTextHeight)

		rightTextLayer.frame = CGRect(x: rightHandleLayer.frame.minX - 0.5 * (kTextWidth - leftHandleLayer.frame.width), y: leftTextLayer.frame.minY, width: kTextWidth, height: kTextHeight)

		setLabelText()
		updateHighlightedBar()
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	private func setInitValue() {

		leftValue = insideMin
		rightValue = insideMax
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	private func updateHighlightedBar() {

		highlightedImageView.frame = CGRect(x:leftHandleLayer.frame.maxX - 0.5 * handleWidth, y: 0.5 * (frame.height - barHeight), width: rightHandleLayer.frame.minX - leftHandleLayer.frame.maxX + handleWidth, height: barHeight)

		setLabelText()
		valueChangeClosure?(leftValue/insideAccuracy * insideAccuracy,rightValue/insideAccuracy * insideAccuracy)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	private func setLabelText() {

		let leftText = stringPrefix + "\(leftValue/insideAccuracy * insideAccuracy)"
		leftTextLayer.string = NSAttributedString(string: leftText, attributes: textAttributes)

		let rightText = stringPrefix + "\(rightValue/insideAccuracy * insideAccuracy)"
		rightTextLayer.string = NSAttributedString(string: rightText, attributes: textAttributes)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	private func createHandleLayer() -> CALayer{

		let layer = CALayer()
		layer.cornerRadius = handleWidth * 0.5
		layer.backgroundColor = handleColor.cgColor
		layer.borderWidth = 1
		layer.borderColor = normalBackgroundColor.cgColor
		return layer
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	private func createTextLayer() -> CATextLayer{

		let layer = CATextLayer()
		layer.contentsScale = UIScreen.main.scale
		layer.foregroundColor = textColor.cgColor
		layer.fontSize = 12
		layer.alignmentMode = CATextLayerAlignmentMode(rawValue: "center")
		return layer
	}
}

//-----------------------------------------------------------------------------------------------------------------------------------------------
extension RangeSlider {

	//-------------------------------------------------------------------------------------------------------------------------------------------
	private func setHitRect(rect: CGRect) -> CGRect {

		let offset:CGFloat = 10
		return CGRect(x: rect.minX, y: rect.minY - offset, width: rect.width, height: 2 * offset + rect.height)
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {

		previouslocation = touch.location(in: self)
		isLeftSelected = setHitRect(rect: leftHandleLayer.frame).contains(previouslocation)
		isRightSelected = setHitRect(rect: rightHandleLayer.frame).contains(previouslocation)
		return isLeftSelected || isRightSelected
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {

		let location = touch.location(in: self)
		let deltaLocation = (location.x - previouslocation.x)
		previouslocation = location

		if isLeftSelected {
			CATransaction.begin()
			CATransaction.setDisableActions(true)
			leftHandleLayer.frame.origin.x = max(leftHandleLayer.frame.origin.x + deltaLocation, normalbackImageView.frame.minX + 0.5 * handleWidth - leftHandleLayer.frame.width)
			leftHandleLayer.frame.origin.x = min(leftHandleLayer.frame.origin.x, rightHandleLayer.frame.origin.x - leftHandleLayer.frame.width)
			leftValue = Int(leftHandleLayer.frame.origin.x/barWidth * CGFloat(insideMax - insideMin)) + insideMin
			leftTextLayer.frame.origin.x = (leftHandleLayer.frame.origin.x - (leftHandleLayer.frame.size.width/2))
			updateHighlightedBar()
			CATransaction.commit()

		} else if isRightSelected {
			CATransaction.begin()
			CATransaction.setDisableActions(true)
			rightHandleLayer.frame.origin.x = min(rightHandleLayer.frame.origin.x + deltaLocation,frame.width - rightHandleLayer.frame.width)
			rightHandleLayer.frame.origin.x = max(rightHandleLayer.frame.origin.x,leftHandleLayer.frame.origin.x + leftHandleLayer.frame.width)
			rightValue = Int((rightHandleLayer.frame.origin.x - leftHandleLayer.frame.width)/barWidth * CGFloat(insideMax - insideMin)) + insideMin
			rightTextLayer.frame.origin.x = (rightHandleLayer.frame.origin.x - (rightHandleLayer.frame.size.width/2))
			updateHighlightedBar()
			CATransaction.commit()
		}

		return true
	}

	//-------------------------------------------------------------------------------------------------------------------------------------------
	override func endTracking(_ touch: UITouch?, with event: UIEvent?) {

		isLeftSelected = false
		isRightSelected = false
	}
}

