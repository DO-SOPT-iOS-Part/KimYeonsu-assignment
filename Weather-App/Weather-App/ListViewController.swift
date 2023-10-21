//
//  ListViewController.swift
//  Weather-App
//
//  Created by yeonsu on 10/19/23.
//

import UIKit
import SwiftUI

class ListViewController: UIViewController {
    
    let nextViewController = DetailViewController()
    
    //MARK: - 객체 생성
    // 더보기 버튼
    let etcButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "icon-etc")
        
        button.setImage(image, for: .normal)
        return button
    }()
    // 앱 타이틀
    let appTitle: UILabel = {
        let title = UILabel()
        let customFont = UIFont(name: "SFProText-Bold", size: 36.0)
        title.font = customFont
        title.text = "날씨"
        title.textColor = .white
        
        return title
    }()
    // 서치 텍스트필드
    let searchTextField: UITextField = {
        let textField = UITextField()
        let placeholderTextColor = UIColor.lightGray
        textField.borderStyle = .roundedRect
        textField.placeholder = "도시 또는 공항 검색"
        textField.textColor = .white
        
        // placeholder 컬러 설정
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: placeholderTextColor
        ]
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: attributes)
        textField.backgroundColor = .secondarySystemFill
        
        // 검색 아이콘 설정
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        imageView.image = UIImage(named: "icon-search")
        textField.leftView = imageView
        textField.leftViewMode = .always
        
        let marginView = UIView()
        imageView.frame = CGRect(x: 0, y: 0, width: 8, height: 24)
        
        
        return textField
    }()
    // 리스트 뷰
    let listView: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bg-list")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let title = UILabel()
        let customTitleFont = UIFont(name: "SFProText-Bold", size: 24.0)
        title.font = customTitleFont
        title.text = "나의 위치"
        title.textColor = .white
        
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
            title.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10)
        ])
        
        let locationTitle = UILabel()
        let customLocationFont = UIFont(name: "SFProText-Regular", size: 17.0)
        locationTitle.font = customLocationFont
        locationTitle.text = "의정부시"
        locationTitle.textColor = .white
        
        view.addSubview(locationTitle)
        locationTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationTitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            locationTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2)
        ])
        
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Light", size: 52.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "21°"
        degreeNumber.textColor = .white
        
        view.addSubview(degreeNumber)
        degreeNumber.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            degreeNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            degreeNumber.topAnchor.constraint(equalTo: view.topAnchor, constant: 4)
        ])
        
        let statusText = UILabel()
        let customStatusFont = UIFont(name: "SFProText-Regular", size: 16.0)
        statusText.font = customStatusFont
        statusText.text = "흐림"
        statusText.textColor = .white
        
        view.addSubview(statusText)
        statusText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusText.leadingAnchor.constraint(equalTo: locationTitle.leadingAnchor),
            statusText.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10)
        ])
        
        let todayDegreeNumber = UILabel()
        let customTodayDegreeFont = UIFont(name: "SFProText-Regular", size: 16.0)
        todayDegreeNumber.font = customTodayDegreeFont
        todayDegreeNumber.text = "최고:29° 최저:15°"
        todayDegreeNumber.textColor = .white
        
        view.addSubview(todayDegreeNumber)
        todayDegreeNumber.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayDegreeNumber.trailingAnchor.constraint(equalTo: degreeNumber.trailingAnchor),
            todayDegreeNumber.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10)
        ])

        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .black
        self.view.addSubview(etcButton)
        self.view.addSubview(appTitle)
        self.view.addSubview(searchTextField)
        self.view.addSubview(listView)

        etcButton.translatesAutoresizingMaskIntoConstraints = false
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        listView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            etcButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            etcButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            etcButton.heightAnchor.constraint(equalToConstant: 44),
            etcButton.widthAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            appTitle.topAnchor.constraint(equalTo: etcButton.bottomAnchor, constant: 0),
            appTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            searchTextField.topAnchor.constraint(equalTo: appTitle.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            listView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            listView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            listView.heightAnchor.constraint(equalToConstant: 117),
            listView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 15)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapMyLocationView))
            listView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapMyLocationView() {
        let detailVC = DetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}


extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let vc: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return vc
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(vc: self)
    }
}


#if DEBUG
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ListViewController()
            .toPreview()
    }
}
#endif
