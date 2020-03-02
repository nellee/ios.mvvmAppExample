//
//  StyleExtension.swift
//  
//
//  Created by Danijel Kunkic on 21/02/2018.
//  Copyright © 2018 Neli_IT. All rights reserved.
//

import UIKit
import SnapKit

// swiftlint:disable file_length
extension UIView {
    
    @discardableResult
    public func styleMakeConstraints(_ closure: (_ make: SnapKit.ConstraintMaker) -> Void) -> Self {
        snp.makeConstraints(closure)
        return self
    }
    
    @discardableResult
    public func styleUpdateConstraints(_ closure: (_ make: SnapKit.ConstraintMaker) -> Void) -> Self {
        snp.updateConstraints(closure)
        return self
    }

    @discardableResult
    public func styleParentView(_ parent: UIView) -> Self {
        if let stackView = parent as? UIStackView {
            stackView.addArrangedSubview(self)
        } else {
            parent.addSubview(self)
        }
        return self
    }
    
    public func styleAutoresizingMask(_ autoresizingMask: UIView.AutoresizingMask) -> Self {
        self.autoresizingMask = autoresizingMask
        return self
    }
    
    @discardableResult
    public func styleBackgroundColor(_ background: UIColor?) -> Self {
        self.backgroundColor = background
        return self
    }
    
    @discardableResult
    public func styleContentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
    
    @discardableResult
    public func styleContentHuggingPriority(_ priority: UILayoutPriority, forAxis axis: NSLayoutConstraint.Axis) -> Self {
        setContentHuggingPriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    public func styleContentCompressionResistancePriority(_ priority: UILayoutPriority, forAxis axis: NSLayoutConstraint.Axis) -> Self {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
    
    @discardableResult
    public func styleGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) -> Self {
        addGestureRecognizer(gestureRecognizer)
        return self
    }
    
    @discardableResult
    public func styleHidden(_ hidden: Bool) -> Self {
        if self.isHidden != hidden {
            self.isHidden = hidden
        }
        return self
    }
    
    @discardableResult
    public func styleTag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
    
    @discardableResult
    public func styleTintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }
    
    @discardableResult
    public func styleUserInteractionEnabled(_ enabled: Bool) -> Self {
        self.isUserInteractionEnabled = enabled
        return self
    }
    
    @discardableResult
    public func styleAlpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    @discardableResult
    public func styleIsOpaque(_ isOpaque: Bool) -> Self {
        self.isOpaque = isOpaque
        return self
    }
    
    @discardableResult
    public func styleCenter(_ center: CGPoint) -> Self {
        self.center = center
        return self
    }
    
    @discardableResult
    public func styleFrame(_ frame: CGRect) -> Self {
        self.frame = frame
        return self
    }
    
    @discardableResult
    public func styleBounds(_ bounds: CGRect) -> Self {
        self.bounds = bounds
        return self
    }
    
    @discardableResult
    public func styleLayoutMargins(_ layoutMargins: UIEdgeInsets) -> Self {
        self.layoutMargins = layoutMargins
        return self
    }
    
    @discardableResult
    public func styleClipToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    @discardableResult
    public func styleCard(childViewToClip: UIView? = nil) -> Self {
        let radius: CGFloat = 10
        
        self.layer
            .styleRadius(radius)
            .styleShadow(UIColor.black, opacity: 0.1, offset: CGSize(width: 0, height: 1), radius: 1)
        
        childViewToClip?
            .styleClipToBounds(true)
            .layer.styleRadius(radius)
        
        return self
    }
    
    /// Accessibility extension
    ///
    /// - parameter label: A concise way to identify the control or view. Some examples are “back button” and “recipe image.”
    /// - parameter traits: Describe the element’s state, behavior or usage.
    /// - parameter hint: Describes what action an element completes. For example, “Displays the recipe detail.”
    /// - parameter value: The value of an element. Just imagine using a progress bar or a slider. The current value might read “5 out of 100.”
    @discardableResult
    public func styleAccessibility(label: String? = nil, traits: UIAccessibilityTraits = UIAccessibilityTraits.none, hint: String? = nil, value: String? = nil) -> Self {
        self.isAccessibilityElement = true
        
        self.accessibilityLabel = label
        self.accessibilityTraits = traits
        self.accessibilityHint = hint
        self.accessibilityValue = value
        
        return self
    }
}

extension CALayer {
    
    @discardableResult
    public func styleShadow(_ color: UIColor, opacity: Float, offset: CGSize, radius: CGFloat) -> Self {
        self.masksToBounds = false
        self.shadowColor = color.cgColor
        self.shadowOpacity = opacity
        self.shadowOffset = offset
        self.shadowRadius = radius
        return self
    }
    
    @discardableResult
    public func styleRadius(_ radius: CGFloat) -> Self {
        self.cornerRadius = radius
        return self
    }
    
    @discardableResult
    public func styleBorder(_ width: CGFloat, color: UIColor) -> Self {
        self.borderWidth = width
        self.borderColor = color.cgColor
        return self
    }
}

extension UIStackView {
    
    @discardableResult
    public func styleSpacing(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }
    
    @discardableResult
    public func styleAxis(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }
    
    @discardableResult
    public func styleAlignment(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    public func styleDistribution(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    public func styleLayoutMarginsRelativeArrangement(_ relative: Bool) -> Self {
        self.isLayoutMarginsRelativeArrangement = relative
        return self
    }
}

extension UIControl {
    
    @discardableResult
    public func styleTarget(_ target: AnyObject?, action: Selector, controlEvents: UIControl.Event = .touchUpInside) -> Self {
        addTarget(target, action: action, for: controlEvents)
        return self
    }
}

extension UIButton {
    
    @discardableResult
    public func styleImage(_ image: UIImage?, for state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }
    
    @discardableResult
    public func styleAlignment(_ align: NSTextAlignment) -> Self {
        titleLabel?.textAlignment = align
        return self
    }
    
    @discardableResult
    public func styleTitleColor(_ color: UIColor?) -> Self {
        setTitleColor(color, for: UIControl.State())
        return self
    }
    
    @discardableResult
    public func styleFont(_ font: UIFont?) -> Self {
        titleLabel?.font = font
        return self
    }
    
    @discardableResult
    func styleTitle(_ title: String?) -> Self {
        setTitle(title, for: UIControl.State())
        return self
    }
    
    @discardableResult
    public func styleContentEdgeInsets(_ edgeInsets: UIEdgeInsets) -> Self {
        contentEdgeInsets = edgeInsets
        return self
    }
    
    @discardableResult
    public func styleImageEdgeInsets(_ edgeInsets: UIEdgeInsets) -> Self {
        imageEdgeInsets = edgeInsets
        return self
    }
    
    @discardableResult
    public func styleTitleEdgeInsets(_ edgeInsets: UIEdgeInsets) -> Self {
        titleEdgeInsets = edgeInsets
        return self
    }
    
//    @discardableResult
//    public func styleAction(_ action: ActionAbstract?) -> Self {
//        return styleAction(action, fontDescriptor: nil)
//    }
    
    @discardableResult
    public func styleIsEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    @discardableResult
    public func styleContentHorizontalAlignment(_ alignment: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = alignment
        return self
    }
    
    @discardableResult
    public func styleAdjustImageWhenHighlighted(_ isHighlighted: Bool) -> Self {
        self.adjustsImageWhenHighlighted = isHighlighted
        return self
    }
    
//    @discardableResult
//    public func styleAction(_ action: ActionAbstract?, fontDescriptor: FontDescriptor?) -> Self {
//        if let action = action {
//            // Extra spacing between icon and title added instead padding. Beceause spacing works out of the box for RTL
//            let spacing = action.icon != nil ? "  " : ""
//            if let actionTitle = action.title {
//                if let fontDescriptor = fontDescriptor {
//                    styleTitle(spacing + actionTitle.uppercased(), fontDescriptor: fontDescriptor)
//                }
//                else {
//                    styleTitle(spacing + actionTitle.uppercased())
//                }
//            }
//
//            if let icon = action.icon {
//                loadImageInfo(icon, toTargetImageView: nil) { [weak self] (image) in
//                    self?.styleImage(image?.withRenderingMode(.alwaysOriginal))
//                }
//
//                if let accent = action.accent {
//                    styleTintColor(UIColor.getColor(accent))
//                }
//            }
//        }
//
//        return self
//    }
}

extension UILabel {
    
    @discardableResult
    public func styleNumberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }
    
    @discardableResult
    public func styleAlignment(_ align: NSTextAlignment) -> Self {
        textAlignment = align
        return self
    }
    
    @discardableResult
    public func styleFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func styleAdjustsFontSizeToFitWidth() -> Self {
        self.adjustsFontSizeToFitWidth = true
        return self
    }
    
    @discardableResult
    public func styleMinimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self {
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    @discardableResult
    public func styleTextColor(_ textColor: UIColor?) -> Self {
        self.textColor = textColor
        return self
    }
    
    @discardableResult
    public func styleText(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    public func styleAttributedText(_ text: NSAttributedString?) -> Self {
        self.attributedText = text
        return self
    }
    
    @discardableResult
    public func styleLineBreakMode(_ mode: NSLineBreakMode) -> Self {
        self.lineBreakMode = mode
        return self
    }
    
//    @discardableResult
//    public func styleText(_ text: String? = nil, fontSize: FontSize? = nil, fontStyle: FontStyle? = nil, fontColor: Color? = nil) -> Self {
//        self.text = text
//
//        if let fontColor = fontColor {
//            self.textColor = UIColor.colorPalette().color(fontColor)
//        }
//
//        if fontSize != nil || fontStyle != nil {
//            var fontSizeNew = font.pointSize
//            if let fontSize = fontSize {
//                fontSizeNew  = UIConfiguration.shared.fontSize.getSize(fontSize: fontSize)
//            }
//
//            font = UIFont.font(fontSizeNew, style: fontStyle)
//        }
//
//        return self
//    }
    
//    @discardableResult
//    public func styleHeight(_ minLines: Int?) -> Self {
//        guard let minLines = minLines else { return self }
//        //so far we only need top vertical align
//        self.contentMode = .top
//
//        let font = self.font ?? UIFont.font()
//        let text = " "
//
//        let textString = text as NSString
//        let textAttributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font: font]
//
//        // width is '10' because it is enough for " " string, and height is '100' which is enough for highest font size (38)
//        let size = textString.boundingRect(with: CGSize(width: 10, height: 100), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
//        let height = ceil(size.height * CGFloat(minLines))
//
//        self.snp.makeConstraints{ (make) in
//            make.height.greaterThanOrEqualTo(height)
//        }
//
//        return self
//    }
}

extension UITextView {
    
    @discardableResult
    public func styleFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func styleTextColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    public func styleText(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    @discardableResult
    public func styleIsScrollEnabled(_ isScrollEnabled: Bool) -> Self {
        self.isScrollEnabled = isScrollEnabled
        return self
    }
    
    @discardableResult
    public func styleAttributedText(_ text: NSAttributedString?) -> Self {
        self.attributedText = text
        return self
    }
}

extension UITextField {

    @discardableResult
    public func stylePlaceholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }
    
    @discardableResult
    public func styleAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    
    @discardableResult
    public func styleInputAccessoryView(_ view: UIView?) -> Self {
        self.inputAccessoryView = view
        return self
    }
    
    @discardableResult
    public func styleFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    
    @discardableResult
    public func styleTextColor(_ color: UIColor) -> Self {
        self.textColor = color
        return self
    }
    
    @discardableResult
    public func styleSecureTextEntry(_ secureTextEntry: Bool) -> Self {
        self.isSecureTextEntry = secureTextEntry
        return self
    }
    
//    @discardableResult
//    public func styleText(_ text: String? = nil, fontDescriptor: FontDescriptor) -> Self {
//        return styleText(text, fontSize: fontDescriptor.fontSize, fontStyle: fontDescriptor.fontStyle, fontColor: fontDescriptor.fontColor)
//    }
    
//    @discardableResult
//    public func styleText(_ text: String? = nil, fontSize: FontSize? = nil, fontStyle: FontStyle? = nil, fontColor: Color? = nil) -> Self {
//        if let text = text {
//            self.text = text
//        }
//
//        if let fontColor = fontColor {
//            self.textColor = UIColor.colorPalette().color(fontColor)
//        }
//
//        var fontSizeNew: CGFloat? = nil
//        if let fontSize = fontSize {
//            fontSizeNew = UIConfiguration.shared.fontSize.getSize(fontSize: fontSize)
//        }
//
//        font = UIFont.font(fontSizeNew, style: fontStyle)
//
//        return self
//    }
}

extension UIScrollView {
    
    @discardableResult
    public func stylePagingEnabled(_ pagingEnabled: Bool) -> Self {
        self.isPagingEnabled = pagingEnabled
        return self
    }
    
    @discardableResult
    public func styleShowsHorizontalScrollIndicator(_ showsHorizontal: Bool) -> Self {
        self.showsHorizontalScrollIndicator = showsHorizontal
        return self
    }
    
    @discardableResult
    public func styleShowsVerticalScrollIndicator(_ showsVertical: Bool) -> Self {
        self.showsVerticalScrollIndicator = showsVertical
        return self
    }
    
    @discardableResult
    public func styleBounces(_ bounces: Bool) -> Self {
        self.bounces = bounces
        return self
    }
}

extension UIImageView {
    
    @discardableResult
    public func styleImage(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
}

extension UIBarButtonItem {
    
    /// Accessibility extension
    ///
    /// - parameter label: A concise way to identify the control or view. Some examples are “back button” and “recipe image.”
    /// - parameter traits: Describe the element’s state, behavior or usage.
    /// - parameter hint: Describes what action an element completes. For example, “Displays the recipe detail.”
    @discardableResult
    public func styleAccessibility(label: String? = nil, traits: UIAccessibilityTraits = UIAccessibilityTraits.button) -> Self {
        self.isAccessibilityElement = true
        
        self.accessibilityLabel = label
        self.accessibilityTraits = traits
        
        return self
    }
}

extension UISegmentedControl {
    
    @discardableResult
    func styleSelectedSegmentIndex(_ index: Int) -> Self {
        self.selectedSegmentIndex = index
        return self
    }
}

extension UISwitch {
    
    @discardableResult
    func styleOnTintColor(_ color: UIColor) -> Self {
        self.onTintColor = color
        return self
    }
    
    @discardableResult
    func styleThumbTintColor(_ color: UIColor) -> Self {
        self.thumbTintColor = color
        return self
    }
}

extension UIActivityIndicatorView {
    
    @discardableResult
    func styleColor(_ color: UIColor) -> Self {
        self.color = color
        return self
    }
    
    @discardableResult
    func styleActivityIndicatorViewStyle(_ style: UIActivityIndicatorView.Style) -> Self {
        self.style = style
        return self
    }
}

extension UIPageControl {
    
    @discardableResult
    func stylePageIndicatorTintColor(_ tintColor: UIColor) -> Self {
        self.pageIndicatorTintColor = tintColor
        return self
    }
    
    @discardableResult
    func styleCurrentPageIndicatorTintColor(_ tintColor: UIColor) -> Self {
        self.currentPageIndicatorTintColor = tintColor
        return self
    }
}

extension UITableView {
    
    @discardableResult
    func styleSeparator(_ separator: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = separator
        return self
    }
}
