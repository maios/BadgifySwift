//
//  BadgeView.swift
//  BadgifySwift
//
//  Created by Mai Mai on 2/5/18.
//  Copyright © 2018 maimaios. All rights reserved.
//

import UIKit

open class BadgeView: UIView {

    open var textColor: UIColor = .white {
        didSet {
            updateState()
        }
    }

    open var badgeFont: UIFont = .systemFont(ofSize: 12) {
        didSet {
            updateState()
        }
    }

    open var minBadgeSize: CGSize = CGSize(width: 20, height: 20) {
        didSet {
            adjustLayout()
        }
    }

    open var xOffset: CGFloat = 0.0 {
        didSet {
            adjustLayout()
        }
    }

    open var yOffset: CGFloat = 0.0 {
        didSet {
            adjustLayout()
        }
    }

    // MARK: Initialization

    public convenience init() {
        self.init(frame: .zero)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupDefaultAppearance()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UI Appearance

    lazy var badgeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()

    func setupDefaultAppearance() {
        clipsToBounds = false
        isHidden = true
        backgroundColor = .red

        addSubview(badgeLabel)

        badgeLabel.textColor = textColor
        badgeLabel.font = badgeFont
    }

    // MARK: Layout

    override open func layoutSubviews() {
        super.layoutSubviews()

        adjustLayout()
    }

    func adjustLayout() {
        badgeLabel.sizeToFit()

        let width = max(minBadgeSize.width, badgeLabel.frame.width)
        let height = max(minBadgeSize.height, badgeLabel.frame.height)

        var frame = superview?.bounds ?? .zero
        frame.origin.x = frame.maxX - width / 2.0 - xOffset
        frame.origin.y = yOffset - height / 2.0
        frame.size = CGSize(width: width, height: height)

        self.frame = frame
        layer.cornerRadius = height / 2.0

        badgeLabel.center = CGPoint(x: width / 2.0, y: height / 2.0)
    }

    // MARK:

    open var badgeValue: Int = 0 {
        didSet {
            guard badgeValue < 0  else {
                return
            }

            badgeImage = nil
            updateState()
        }
    }

    open var badgeImage: UIImage? = nil {
        didSet {
            guard badgeImage != nil else {
                return
            }

            badgeValue = 0
            updateState()
        }
    }

    func updateState() {
        let attributes: [NSAttributedStringKey: Any] = [
            .font: badgeFont,
            .foregroundColor: textColor,
            ]

        let attributedString: NSAttributedString?
        if badgeValue > 0 {
            attributedString = NSAttributedString(string: "\(badgeValue)", attributes: attributes)
        } else {
            attributedString = NSAttributedString(image: badgeImage)
        }

        badgeLabel.attributedText = attributedString

        if let attributedString = attributedString, !attributedString.isEmpty {
            adjustLayout()
            show()
        } else {
            hide()
        }
    }

    // MARK: Visibility

    open func show() {
        isHidden = false
    }

    open func hide() {
        isHidden = true
    }

    // MARK:

    open func increment() {
        badgeValue += 1
    }

    open func decrement() {
        badgeValue -= 1
    }
}
