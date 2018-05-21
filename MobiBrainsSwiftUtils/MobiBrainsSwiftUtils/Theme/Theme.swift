//
//  Theme.swift
//  MobiBrainsSwiftUtils
//
//  Created by Mahesh Asabe on 21/05/18.
//

import Foundation

public class Theme
{
    public static let shared = Theme()
    var currentThemeFileName:String?
    private var themeDictionary:[String:AnyObject]?
    
    private init() {
        
    }
    
    public func setupTheme(withThemeFileName fileName:String) {

        currentThemeFileName = fileName
        
        guard let fileName = self.currentThemeFileName else { return }
        guard let plistPath = Bundle.main.path(forResource: fileName, ofType: "plist") else { return }
        guard let plistData = FileManager.default.contents(atPath: plistPath) else { return }
        var format = PropertyListSerialization.PropertyListFormat.xml
        guard let  plistDict = try! PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: &format) as? [String : AnyObject] else { return }
        
        themeDictionary = plistDict
    }
 
    private func strokeAttribute(_ dict:[String:Any], customSize:CGFloat?) -> [NSAttributedStringKey: Any] {
        
        var fontSize = customSize
        if customSize == nil {
            fontSize = (CGFloat(dict["textSize"] as! Int))
        }
        
        let strokeTextAttributes: [NSAttributedStringKey: Any] = [
            .strokeColor : UIColor.init(hex: dict["strokeColor"] as! String),
            .foregroundColor : UIColor.init(hex: dict["textColor"] as! String),
            .backgroundColor : UIColor.init(hex: dict["backgroundColor"] as! String),
            .strokeWidth : -2.0,
            .font : UIFont.init(name: (dict["font"] as! String), size: fontSize!) ?? UIFont.systemFont(ofSize: 14.0)
        ]
        return strokeTextAttributes
    }
    
    public func attributesForLabel(_ labelType:String) -> [NSAttributedStringKey: Any] {
        guard let dict = self.themeDictionary![labelType] as? [String:Any] else {
            return [NSAttributedStringKey: Any]()
        }
        return strokeAttribute(dict, customSize:nil)
    }
    
    public func attributesForLabel(_ labelType:String, fontSize:CGFloat) -> [NSAttributedStringKey: Any] {
        guard let dict = self.themeDictionary![labelType] as? [String:Any] else {
            return [NSAttributedStringKey: Any]()
        }
        return strokeAttribute(dict, customSize:fontSize)
    }
}
