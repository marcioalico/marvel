//
//  MarvelRouter.swift
//  Marvel
//
//  Created by Marcio Alico on 12/28/21.
//

import Foundation
import UIKit

protocol MarvelRouter {
    func getViewController() -> MarvelViewController
    func setViewController(sourceView: MarvelViewController?)
}
