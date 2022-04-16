//
//  ContentSizedTableView.swift
//  MobilliumCase
//
//  Created by Cüneyt ALSU on 14.04.2022.
//

import Foundation
import UIKit

class ContentSizedTableView: UITableView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
