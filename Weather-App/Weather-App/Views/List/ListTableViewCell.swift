//
//  ListTableViewCell.swift
//  Weather-App
//
//  Created by yeonsu on 11/8/23.
//

import UIKit
import Then
import SnapKit
import Combine

class ListTableViewCell: UITableViewCell {
    
    static let identifier: String = "ItemListTableViewCell"
    
    private var getWeatherService: GetWeatherService = GetWeatherService()
    private var cancellable: AnyCancellable?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // setPublishers()
        setConstraints()
    
    }
    
    override func prepareForReuse() {
        cancellable?.cancel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let listView = UIImageView().then {
        $0.image = UIImage(named: "bg-list")
    }
    
    private let myLocationLabel = UILabel().then {
        let customTitleFont = UIFont(name: "SFProText-Bold", size: 24.0)
        $0.font = customTitleFont
        $0.text = "나의 위치"
        $0.textColor = .white
    }
    
    private let currentTimeLabel = UILabel().then {
        let customTitleFont = UIFont(name: "SFProText-Medium", size: 17.0)
        $0.font = customTitleFont
        $0.text = "의정부시"
        $0.textColor = .white
    }
    
    private let degreeNumber = UILabel().then {
        let customDegreeFont = UIFont(name: "SFProText-Light", size: 52.0)
        $0.font = customDegreeFont
        $0.text = "21°"
        $0.textColor = .white
    }
    
    private let statusText = UILabel().then {
        let customStatusFont = UIFont(name: "SFProText-Regular", size: 16.0)
        $0.font = customStatusFont
        $0.text = "흐림"
        $0.textColor = .white
    }
    
    private let todayDegreeNumber = UILabel().then {
        let customTodayDegreeFont = UIFont(name: "SFProText-Regular", size: 16.0)
        $0.font = customTodayDegreeFont
        $0.text = "최고:29° 최저:15°"
        $0.textColor = .white
    }
    
    private func setConstraints() {
        
        self.contentView.addSubview(listView)
        self.listView.addSubviews(myLocationLabel,
                                  currentTimeLabel,
                                  degreeNumber,
                                  statusText,
                                  todayDegreeNumber
        )
        self.contentView.backgroundColor = .black
        
        listView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(117)
        }
        myLocationLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(10)
        }
        currentTimeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(myLocationLabel.snp.bottom).offset(2)
        }
        degreeNumber.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
        statusText.snp.makeConstraints {
            $0.leading.equalTo(currentTimeLabel)
            $0.bottom.equalToSuperview().inset(10)
        }
        todayDegreeNumber.snp.makeConstraints {
            $0.trailing.equalTo(degreeNumber)
            $0.bottom.equalTo(statusText)
        }
    }
    
    func setUI(weather: WeatherResponse) {
        myLocationLabel.text = weather.name
        currentTimeLabel.text = convertTimeZoneOffsetToString(weather.timezone)
        degreeNumber.text = "\(formatNumberToOneDecimalPlace(weather.main.temp!))°"
        todayDegreeNumber.text = "최고:\(formatNumberToOneDecimalPlace(weather.main.temp_max!))° 최저:\(formatNumberToOneDecimalPlace(weather.main.temp_min!))°"
        }
    
    func convertTimeZoneOffsetToString(_ offset: Int) -> String {
        let hours = offset / 3600
        let minutes = abs((offset % 3600) / 60)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone(secondsFromGMT: offset)
        
        let formattedString = formatter.string(from: Date())
        
        return formattedString
    }
    
    func formatNumberToOneDecimalPlace(_ number: Double) -> String {
        let formattedNumber = String(format: "%.1f", number)
        return formattedNumber
    }
}
