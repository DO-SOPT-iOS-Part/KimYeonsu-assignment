//
//  DetailViewController.swift
//  Weather-App
//
//  Created by yeonsu on 10/21/23.
//

import UIKit
import SwiftUI

class DetailViewController: UIViewController {
    
    let scrollView = UIScrollView()
    var contentView = UIView()
    
    let horizontalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let horizontalContentView: UIView = {
        let content = UIView()
        
        return content
    }()
    
    let locationText: UILabel = {
        let title = UILabel()
        let customFont = UIFont(name: "SFProText-Medium", size: 36.0)
        title.font = customFont
        title.text = "의정부시"
        title.textColor = .white
        
        return title
    }()
    
    let degreeNumber: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Thin", size: 102.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "21°"
        degreeNumber.textColor = .white
        
        return degreeNumber
    }()
    
    let statusText: UILabel = {
        let statusText = UILabel()
        let customStatusFont = UIFont(name: "SFProText-Regular", size: 24.0)
        statusText.font = customStatusFont
        statusText.text = "흐림"
        statusText.textColor = .white
        
        return statusText
    }()
    
    let todayDegreeNumber: UILabel = {
        let todayDegreeNumber = UILabel()
        let customStatusFont = UIFont(name: "SFProText-Medium", size: 20.0)
        todayDegreeNumber.font = customStatusFont
        todayDegreeNumber.text = "최고:29° 최저:15°"
        todayDegreeNumber.textColor = .white
        
        return todayDegreeNumber
    }()
    
    let forecastText: UILabel = {
        let forecastText = UILabel()
        let customStatusFont = UIFont(name: "SFProText-Medium", size: 18.0)
        forecastText.font = customStatusFont
        forecastText.textColor = .white
        forecastText.text = "08:00~09:00에 강우 상태가, 18:00에 한 때 흐린 상태가 예상됩니다."
        forecastText.numberOfLines = 0
        
        return forecastText
    }()
    
    let lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = .white
        
        return lineView
    }()
    
    let bottomLineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05)
        
        return lineView
    }()
    
    let bottomView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .brown
        return uiView
    }()
    
    let mapiconView: UIButton = {
        let view = UIButton()
        let imageView =  UIImage(named: "icon-map")
        
        view.setImage(imageView, for: .normal)
        
        return view
    }()
    
    let listIconView: UIButton = {
        let view = UIButton()
        let imageView =  UIImage(named: "icon-list")
        
        view.setImage(imageView, for: .normal)
        return view
    }()
    
    
    let weatherContentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.01)
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05).cgColor
        contentView.layer.borderWidth = 1
        
        return contentView
    }()
    
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let directionIconView: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon-direction")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let pageIconView: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon-page")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    
    let timeLabel: UILabel = {
        let text = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 17.0)
        text.font = customDegreeFont
        text.text = "Now"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let iconView: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status-blur")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let degreeForDayText: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 22.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "21°"
        degreeNumber.textColor = .white
        degreeNumber.textAlignment = .center
        
        return degreeNumber
    }()
    
    let verticalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    let timeLabel2: UILabel = {
        let text = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 17.0)
        text.font = customDegreeFont
        text.text = "10시"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let iconView2: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status-drizzle")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let degreeForDayText2: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 22.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "21°"
        degreeNumber.textColor = .white
        degreeNumber.textAlignment = .center
        
        return degreeNumber
    }()
    
    let verticalStackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    let timeLabel3: UILabel = {
        let text = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 19.0)
        text.font = customDegreeFont
        text.text = "11시"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let iconView3: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status-rain")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let degreeForDayText3: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 22.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "19°"
        degreeNumber.textColor = .white
        degreeNumber.textAlignment = .center
        
        return degreeNumber
    }()
    
    let verticalStackView4: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    let timeLabel4: UILabel = {
        let text = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 17.0)
        text.font = customDegreeFont
        text.text = "12시"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let iconView4: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status-thunder")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let degreeForDayText4: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 22.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "19°"
        degreeNumber.textColor = .white
        degreeNumber.textAlignment = .center
        
        return degreeNumber
    }()
    
    let verticalStackView5: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    let timeLabel5: UILabel = {
        let text = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 17.0)
        text.font = customDegreeFont
        text.text = "1시"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let iconView5: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status-shower")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let degreeForDayText5: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 22.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "19°"
        degreeNumber.textColor = .white
        degreeNumber.textAlignment = .center
        
        return degreeNumber
    }()
    
    let verticalStackView6: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    let timeLabel6: UILabel = {
        let text = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 17.0)
        text.font = customDegreeFont
        text.text = "2시"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let iconView6: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status-drizzle")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let degreeForDayText6: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 22.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "21°"
        degreeNumber.textColor = .white
        degreeNumber.textAlignment = .center
        
        return degreeNumber
    }()
    
    let verticalStackView7: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    let timeLabel7: UILabel = {
        let text = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 17.0)
        text.font = customDegreeFont
        text.text = "3시"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let iconView7: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status-rain")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let degreeForDayText7: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 22.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "22°"
        degreeNumber.textColor = .white
        degreeNumber.textAlignment = .center
        
        return degreeNumber
    }()
    
    let verticalStackView10: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    let timeLabel10: UILabel = {
        let text = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 17.0)
        text.font = customDegreeFont
        text.text = "6시"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let iconView10: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status-blur")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let degreeForDayText10: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 22.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "19°"
        degreeNumber.textColor = .white
        degreeNumber.textAlignment = .center
        
        return degreeNumber
    }()
    
    let verticalStackView8: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    let timeLabel8: UILabel = {
        let text = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 17.0)
        text.font = customDegreeFont
        text.text = "4시"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let iconView8: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status-drizzle")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let degreeForDayText8: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 22.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "20°"
        degreeNumber.textColor = .white
        degreeNumber.textAlignment = .center
        
        return degreeNumber
    }()
    
    let verticalStackView9: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    let timeLabel9: UILabel = {
        let text = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 17.0)
        text.font = customDegreeFont
        text.text = "5시"
        text.textAlignment = .center
        text.textColor = .white
        return text
    }()
    
    let iconView9: UIView = {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = UIImage(named: "status-drizzle")
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        return view
    }()
    
    let degreeForDayText9: UILabel = {
        let degreeNumber = UILabel()
        let customDegreeFont = UIFont(name: "SFProText-Medium", size: 22.0)
        degreeNumber.font = customDegreeFont
        degreeNumber.text = "20°"
        degreeNumber.textColor = .white
        degreeNumber.textAlignment = .center
        
        return degreeNumber
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackGroundUI()
        self.scrollView.backgroundColor = .clear
        setLayout()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapListIcon))
            listIconView.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func tapListIcon() {
        let listVC = ListViewController()
        self.navigationController?.popViewController(animated: true)
    }
    
    func setBackGroundUI() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
    }
    
    
    func setLayout() {
        scrollView.showsVerticalScrollIndicator = false
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.alwaysBounceVertical = true
        contentView.addSubview(locationText)
        contentView.addSubview(degreeNumber)
        contentView.addSubview(statusText)
        contentView.addSubview(todayDegreeNumber)
        contentView.addSubview(weatherContentView)
        self.view.addSubview(bottomView)
        self.view.addSubview(mapiconView)
        self.view.addSubview(listIconView)
        self.view.addSubview(bottomLineView)
        self.view.addSubview(horizontalStackView)
        weatherContentView.addSubview(forecastText)
        weatherContentView.addSubview(lineView)
        weatherContentView.addSubview(horizontalScrollView)
        horizontalScrollView.addSubview(horizontalContentView)
        horizontalScrollView.alwaysBounceHorizontal = true
        horizontalContentView.addSubview(verticalStackView)
        horizontalContentView.addSubview(verticalStackView2)
        horizontalContentView.addSubview(verticalStackView3)
        horizontalContentView.addSubview(verticalStackView4)
        horizontalContentView.addSubview(verticalStackView5)
        horizontalContentView.addSubview(verticalStackView6)
        horizontalContentView.addSubview(verticalStackView7)
        horizontalContentView.addSubview(verticalStackView8)
        horizontalContentView.addSubview(verticalStackView9)
        horizontalContentView.addSubview(verticalStackView10)
        
        directionIconView.translatesAutoresizingMaskIntoConstraints = false
        pageIconView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        mapiconView.translatesAutoresizingMaskIntoConstraints = false
        listIconView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        horizontalContentView.translatesAutoresizingMaskIntoConstraints = false
        locationText.translatesAutoresizingMaskIntoConstraints = false
        degreeNumber.translatesAutoresizingMaskIntoConstraints = false
        statusText.translatesAutoresizingMaskIntoConstraints = false
        todayDegreeNumber.translatesAutoresizingMaskIntoConstraints = false
        weatherContentView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        forecastText.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        degreeForDayText.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView2.translatesAutoresizingMaskIntoConstraints = false
        iconView2.translatesAutoresizingMaskIntoConstraints = false
        timeLabel2.translatesAutoresizingMaskIntoConstraints = false
        degreeForDayText2.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView3.translatesAutoresizingMaskIntoConstraints = false
        iconView3.translatesAutoresizingMaskIntoConstraints = false
        timeLabel3.translatesAutoresizingMaskIntoConstraints = false
        degreeForDayText3.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView4.translatesAutoresizingMaskIntoConstraints = false
        iconView4.translatesAutoresizingMaskIntoConstraints = false
        timeLabel4.translatesAutoresizingMaskIntoConstraints = false
        degreeForDayText4.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView5.translatesAutoresizingMaskIntoConstraints = false
        iconView5.translatesAutoresizingMaskIntoConstraints = false
        timeLabel5.translatesAutoresizingMaskIntoConstraints = false
        degreeForDayText5.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView6.translatesAutoresizingMaskIntoConstraints = false
        iconView6.translatesAutoresizingMaskIntoConstraints = false
        timeLabel6.translatesAutoresizingMaskIntoConstraints = false
        degreeForDayText6.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView7.translatesAutoresizingMaskIntoConstraints = false
        iconView7.translatesAutoresizingMaskIntoConstraints = false
        timeLabel7.translatesAutoresizingMaskIntoConstraints = false
        degreeForDayText7.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView8.translatesAutoresizingMaskIntoConstraints = false
        iconView8.translatesAutoresizingMaskIntoConstraints = false
        timeLabel8.translatesAutoresizingMaskIntoConstraints = false
        degreeForDayText8.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView9.translatesAutoresizingMaskIntoConstraints = false
        iconView9.translatesAutoresizingMaskIntoConstraints = false
        timeLabel9.translatesAutoresizingMaskIntoConstraints = false
        degreeForDayText9.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView10.translatesAutoresizingMaskIntoConstraints = false
        iconView10.translatesAutoresizingMaskIntoConstraints = false
        timeLabel10.translatesAutoresizingMaskIntoConstraints = false
        degreeForDayText10.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        verticalStackView.addArrangedSubview(timeLabel)
        verticalStackView.addArrangedSubview(iconView)
        verticalStackView.addArrangedSubview(degreeForDayText)
        
        verticalStackView2.addArrangedSubview(timeLabel2)
        verticalStackView2.addArrangedSubview(iconView2)
        verticalStackView2.addArrangedSubview(degreeForDayText2)
        
        verticalStackView3.addArrangedSubview(timeLabel3)
        verticalStackView3.addArrangedSubview(iconView3)
        verticalStackView3.addArrangedSubview(degreeForDayText3)
        
        verticalStackView4.addArrangedSubview(timeLabel4)
        verticalStackView4.addArrangedSubview(iconView4)
        verticalStackView4.addArrangedSubview(degreeForDayText4)
        
        verticalStackView5.addArrangedSubview(timeLabel5)
        verticalStackView5.addArrangedSubview(iconView5)
        verticalStackView5.addArrangedSubview(degreeForDayText5)
        
        verticalStackView6.addArrangedSubview(timeLabel6)
        verticalStackView6.addArrangedSubview(iconView6)
        verticalStackView6.addArrangedSubview(degreeForDayText6)
        
        verticalStackView7.addArrangedSubview(timeLabel7)
        verticalStackView7.addArrangedSubview(iconView7)
        verticalStackView7.addArrangedSubview(degreeForDayText7)
        
        verticalStackView8.addArrangedSubview(timeLabel8)
        verticalStackView8.addArrangedSubview(iconView8)
        verticalStackView8.addArrangedSubview(degreeForDayText8)
        
        verticalStackView9.addArrangedSubview(timeLabel9)
        verticalStackView9.addArrangedSubview(iconView9)
        verticalStackView9.addArrangedSubview(degreeForDayText9)
        
        verticalStackView10.addArrangedSubview(timeLabel10)
        verticalStackView10.addArrangedSubview(iconView10)
        verticalStackView10.addArrangedSubview(degreeForDayText10)
        
        horizontalStackView.addArrangedSubview(directionIconView)
        horizontalStackView.addArrangedSubview(pageIconView)

        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                                     scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)])
        
        NSLayoutConstraint.activate([contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
                                     contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
                                     contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 0),
                                     contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor)])
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 34),
            bottomView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
            ])
        
        
        NSLayoutConstraint.activate([mapiconView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                                     mapiconView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([listIconView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                                     listIconView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)])
        
        NSLayoutConstraint.activate([bottomLineView.bottomAnchor.constraint(equalTo: mapiconView.topAnchor, constant: -4),
                                     bottomLineView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     bottomLineView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     bottomLineView.heightAnchor.constraint(equalToConstant: 1)
                                    ])
        
        NSLayoutConstraint.activate([
            locationText.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 34),
            locationText.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)])
        
        NSLayoutConstraint.activate([
            degreeNumber.topAnchor.constraint(equalTo: locationText.bottomAnchor, constant: 4),
            degreeNumber.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)])
        
        NSLayoutConstraint.activate([
            statusText.topAnchor.constraint(equalTo: degreeNumber.bottomAnchor, constant: 4),
            statusText.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)])
        
        NSLayoutConstraint.activate([
            todayDegreeNumber.topAnchor.constraint(equalTo: statusText.bottomAnchor, constant: 4),
            todayDegreeNumber.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)])
        
        NSLayoutConstraint.activate([
            weatherContentView.topAnchor.constraint(equalTo: todayDegreeNumber.bottomAnchor, constant: 44),
            weatherContentView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),           weatherContentView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            weatherContentView.heightAnchor.constraint(equalToConstant: 212)
        ])
        
        NSLayoutConstraint.activate([
            forecastText.leadingAnchor.constraint(equalTo: weatherContentView.leadingAnchor, constant: 14.0),
            forecastText.trailingAnchor.constraint(equalTo: weatherContentView.trailingAnchor, constant: -14.0),
            forecastText.topAnchor.constraint(equalTo: weatherContentView.topAnchor, constant: 10)
        ])

        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: weatherContentView.leadingAnchor, constant: 14.0),
            lineView.trailingAnchor.constraint(equalTo: weatherContentView.trailingAnchor, constant: 0),
            lineView.topAnchor.constraint(equalTo: forecastText.bottomAnchor, constant: 11),
            lineView.heightAnchor.constraint(equalToConstant: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            horizontalScrollView.leadingAnchor.constraint(equalTo: lineView.leadingAnchor, constant: 0.0),
            horizontalScrollView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 13),
            horizontalScrollView.bottomAnchor.constraint(equalTo: weatherContentView.bottomAnchor, constant: -10),
            horizontalScrollView.trailingAnchor.constraint(equalTo: weatherContentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([horizontalContentView.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor),
                                     horizontalContentView.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor, constant: 0),
                                     horizontalContentView.bottomAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor),
                                     horizontalContentView.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor)
                                    
                                    ])
        horizontalContentView.heightAnchor.constraint(equalTo: horizontalScrollView.heightAnchor).isActive = true
        let contentViewWidth = horizontalContentView.widthAnchor.constraint(greaterThanOrEqualTo: view.widthAnchor)
        contentViewWidth.priority = .defaultLow
        contentViewWidth.isActive = true
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: horizontalContentView.leadingAnchor, constant: 0.0),
            verticalStackView.topAnchor.constraint(equalTo: horizontalContentView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            verticalStackView2.leadingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: 22.0),
            verticalStackView2.topAnchor.constraint(equalTo: horizontalContentView.topAnchor),
            verticalStackView2.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            verticalStackView3.leadingAnchor.constraint(equalTo: verticalStackView2.trailingAnchor, constant: 22),
            verticalStackView3.topAnchor.constraint(equalTo: horizontalContentView.topAnchor),
            verticalStackView3.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            verticalStackView4.leadingAnchor.constraint(equalTo: verticalStackView3.trailingAnchor, constant: 22),
            verticalStackView4.topAnchor.constraint(equalTo: horizontalContentView.topAnchor),
            verticalStackView4.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor, constant: 0)
        ])
        
        
        NSLayoutConstraint.activate([
            verticalStackView5.leadingAnchor.constraint(equalTo: verticalStackView4.trailingAnchor, constant: 22),
            verticalStackView5.topAnchor.constraint(equalTo: horizontalContentView.topAnchor),
            verticalStackView5.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor, constant: 0)
        ])
        
        
        NSLayoutConstraint.activate([
            verticalStackView6.leadingAnchor.constraint(equalTo: verticalStackView5.trailingAnchor, constant: 22.0),
            verticalStackView6.topAnchor.constraint(equalTo: horizontalContentView.topAnchor),
            verticalStackView6.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor, constant: 0)
        ])
        
        
        NSLayoutConstraint.activate([
            verticalStackView7.leadingAnchor.constraint(equalTo: verticalStackView6.trailingAnchor, constant: 22.0),
            verticalStackView7.topAnchor.constraint(equalTo: horizontalContentView.topAnchor),
            verticalStackView7.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            verticalStackView8.leadingAnchor.constraint(equalTo: verticalStackView7.trailingAnchor, constant: 22.0),
            verticalStackView8.topAnchor.constraint(equalTo: horizontalContentView.topAnchor),
            verticalStackView8.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            verticalStackView9.leadingAnchor.constraint(equalTo: verticalStackView8.trailingAnchor, constant: 22.0),
            verticalStackView9.topAnchor.constraint(equalTo: horizontalContentView.topAnchor),
            verticalStackView9.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            verticalStackView10.leadingAnchor.constraint(equalTo: verticalStackView9.trailingAnchor, constant: 22.0),
            verticalStackView10.topAnchor.constraint(equalTo: horizontalContentView.topAnchor),
            verticalStackView10.bottomAnchor.constraint(equalTo: horizontalContentView.bottomAnchor, constant: 0),
            verticalStackView10.trailingAnchor.constraint(equalTo: horizontalContentView.trailingAnchor)
        ])
        
        
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor, constant: 0.0),
            timeLabel.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: 0),
            timeLabel.topAnchor.constraint(equalTo: verticalStackView.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: 0),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            degreeForDayText.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: 0)
        ])
        
        
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: bottomLineView.bottomAnchor, constant: 14),
            horizontalStackView.heightAnchor.constraint(equalToConstant: 24),
            horizontalStackView.widthAnchor.constraint(equalToConstant: 54),
            horizontalStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        

        
        
    }
    
}


#if DEBUG
struct VCPreview: PreviewProvider {
    static var previews: some View {
        DetailViewController()
            .toPreview()
    }
}
#endif
