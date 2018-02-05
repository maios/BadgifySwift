//
//  AttributedString.swift
//  BadgifySwift
//
//  Created by Mai Mai on 2/5/18.
//  Copyright © 2018 maimaios. All rights reserved.
//

import Foundation

extension NSAttributedString {

    convenience init?(image: UIImage?) {
        guard let image = image else {
            return nil
        }
        let textAttachment = NSTextAttachment()
        textAttachment.image = image
        self.init(attachment: textAttachment)
    }

    var isEmpty: Bool {
        return string.isEmpty
    }
}
