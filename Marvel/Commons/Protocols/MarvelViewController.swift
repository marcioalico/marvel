//
//  MarvelBaseViewController.swift
//  Marvel
//
//  Created by Marcio Alico on 12/28/21.
//

import Foundation
import UIKit

protocol MarvelViewController: UIViewController {
    var router: MarvelRouter { get set }
    var viewModel: MarvelViewModel { get set }
}
