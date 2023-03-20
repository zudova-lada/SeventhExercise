//
//  ViewController.swift
//  SeventhExercise
//
//  Created by Лада Зудова on 19.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemTeal
        view.contentMode = .scaleAspectFit
        view.showsVerticalScrollIndicator = true
        view.contentSize = CGSize(width: view.frame.width, height: 2000)
        view.delegate = self
        return view
    }()

    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()

    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "Image")!
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        view.image = image
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
        contentView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 1000)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 100 - (scrollView.contentOffset.y + 100)
        let h = max(0, y)
        let rect = CGRect(x: 0, y: -h, width: view.frame.width, height: 300 + h)
        let scrollViewRec = CGRect(x: 0, y: 300 - h, width: view.frame.width, height:  view.frame.height - 300 - h)
        imageView.frame = rect
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 240 + h, left: 0, bottom: 0, right: 0)
        
    }
}
