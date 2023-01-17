//
//  Constans.swift
//  Service
//
//  Created by Ahmad Fouad on 31/01/17.
//  Copyright © 2017 Junaid. All rights reserved.
//

import UIKit


let appDelegate = UIApplication.shared.delegate as! AppDelegate
let bottomColor = UIColor(displayP3Red:245/255 , green: 245/255, blue: 245/255, alpha: 0.6)
let topColor = UIColor(displayP3Red:255/255 , green: 255/255, blue: 255/255, alpha: 1.0)
let droidFont = UIFont(name: "DroidArabicKufi", size: 10)





struct Constants {
    static let skipLandingKey = "skipOutOfLanding"
    static let UserDefault = UserDefaults.standard
    static let AppName: String = "WE Team Care"
    static var medNetworkNo = 1
    static let specializationsNotificationName = Notification.Name("specializationsIsSet")
    static let providerNotificationName = Notification.Name("providerTypeIsSet")
    static let loginNotificationName = Notification.Name("goToLoginScreen")
    static let resetCachNotificationName = Notification.Name("resetCache")
    static let notificationCenter = NotificationCenter.default
    
    static var isUpToDate: Bool = false
    
    //static let userId = "userId"
    static let userName = "userName"
    static let fcmToken = "fcmToken"
    static let userEmail = "userEmail"

    //below added only for case of token subscribtion after login then cleared after being save in keychain
    static var loginToken: String? = nil
    
//    static let key = keys.cryptoKey     //"bbC2H19lkVbQDfakxcrtNMQdd0FloLyw"
//    static let iv = keys.cryptoIV       //"gqLOHUioQ0QjhuvI"
    

    static let account = "employeeAccount"
    static let service1 = "employeeService1"
    static let service2 = "employeeService2"
    static let service3 = "employeeService3"
    static let userId = "userId"
    
    struct StoryBoardFile {
        static let Main                                 = "Main"
        static let Landing                              = "Landing"
        static let Home                                 = "HomePage+Filter"
        static let Doctor                               = "Doctor"
        static let jobsAndLetters                      = "JobsAndLettersTE"
    }
    
    struct StoryBoardIdentifier {
        static let homeVC                = "HomeVC"
        static let homeFamilyViewController                = "HomeFamilyViewController"
        static let dashBoardVC                = "DashBoardVC"
        static let login2VC                = "Login2VC"
       
        static let storyForgotPasswordViewController        = "ForgotPasswordViewController"
        static let storyAddAddressViewController            = "AddAddressViewController"
        static let storyMapViewController                   = "MapViewController"
        static let storyAddressViewController               = "AddressViewController"
        static let storyCategoryDetailViewController        = "CategoryDetailViewController"
        static let storyCategoryViewController              = "CategoryViewController"
        static let storyFillDetailViewController            = "FillDetailViewController"
        static let storyNearbyViewController                = "NearbyProviderViewController"
        static let storyProfileViewController               = "ProfileViewController"
        static let storyTimerViewController                 = "TimerViewController"
        static let storyCardDetailViewController            = "CreditDetailsViewController"
        static let storyReceiptViewController               = "ReceiptViewController"
        static let storyChangePasswordViewController        = "ChangePasswordViewController"
        static let storyEditProfileViewController           = "EditProfileViewController"
        static let storyPrivacyViewController               = "PrivacyViewController"
        static let storyContactUsViewController             = "ContactUsViewController"
        static let storyHomeViewControlller                 = "HomeViewControlller"
        static let storySideMenuViewController              = "SideMenuViewController"
        static let storyBookingHistoryViewController        = "BookingHistoryViewController"
        static let storyUpComingViewController              = "UpComingBookingViewController"
        static let storyPendingViewController               = "PendingRequestViewController"
        static let storyChatListViewController              = "ChatListViewController"
        static let storyNotificationViewController          = "NotificationViewController"
        static let storySettingViewController               = "SettingViewController"
        static let storyReferViewController                 = "ReferViewController"
        static let storyWalletViewController                = "WalletViewController"
        static let storyChattingVC                          = "ChattingVC"
        static let storyInvoiceVC                           = "InvoiceViewController"
        static let storyHistoryDetailVC                     = "HistoryDetailViewController"
        static let storyLandingViewController               = "LandingViewController"
        static let storyUpComingSeeAll                      = "UpComingSeeAllVC"
        static let storyEarnedPointsViewController          = "EarnedPointsViewController"
        static let storyReportViewController                = "ReportViewController"
        
        
        static let storyProviderHomeViewController          = "ProviderHomeViewController"
        static let storyProviderHistoryViewController       = "ProviderHistoryViewController"
        static let storyProviderTaskDetailViewController    = "ProviderTaskDetailViewController"
        static let storyProviderReceiptViewController       = "ProviderReceiptViewController"
        static let storyProviderSettingsViewController      = "ProviderSettingsViewController"
        static let storyProviderFandQViewController         = "ProviderFandQViewController"
    }
    
    static let suspiciousFilePathes = [
        "/Applications/Cydia.app",
        "cydia://",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/bin/bash",
        "/usr/sbin/sshd",
        "/etc/apt",
        "/Applications/Cydia.app",
        "/Applications/blackra1n.app",
        "/Applications/FakeCarrier.app",
        "/Applications/Icy.app",
        "/Applications/IntelliScreen.app",
        "/Applications/MxTube.app",
        "/Applications/RockApp.app",
        "/Applications/SBSettings.app",
        "/Applications/WinterBoard.app",
        "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
        "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
        "/private/var/lib/apt",
        "/private/var/mobile/Library/SBSettings/Themes",
        "/private/var/stash",
        "/private/var/tmp/cydia.log",
        "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
        "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
        "/usr/bin/sshd",
        "/usr/libexec/sftp-server",
        "/usr/sbin/sshd",
        "/var/cache/apt",
        "/var/tmp/cydia.log",
        "/etc/apt/sources.list.d/sileo.sources",
        "/etc/apt/sillyo/sileo.sources",
        "/Applications/iGameGuardian.app",
        "/var/binpack",
        "/var/checkra1n.dmg",
        "/Applications/Snoop-itConfig.app",
        "/usr/libexec/ssh-keysign",
        "/usr/lib/libcycript.dylib",
        "/usr/local/bin/cycript",
        "/usr/bin/cycript",
        "/usr/sbin/frida-server",
        "/usr/libexec/cydia/",
        "/private/var/mobileLibrary/SBSettingsThemes/",
        "/Applications/SBSetttings.app",
        "/private/etc/ssh/sshd_config",
        "/etc/ssh/sshd_config",
        "/private/etc/apt",
        "/bin.sh",
        "/private/etc/dpkg/origins/debian",
        "/var/lib/cydia",
        "/usr/bin/ssh",
        "/Application/Cydia.app",
        "/private/var/lib/cydia",
        "/var/log/syslog",
        "/bin/sh",
        "/private/var/lib/apt/"
    ]
}

struct AlertMsg {
    static let Limit                                        = "لا يسمح بإدخال حروف اكثر من ذلك".localized()
    static let OldPass_Blank                                = "Please enter old password".localized()
    static let NewPass_Blank                                = "Please enter new password".localized()
    static let ConfirmPass_Blank                            = "Please enter confirm password".localized()
    static let Pass_not_Match_REGISTRATIO                   = "Password and confirm password should be same".localized()
    static let Pass_not_Match                               = "New password and confirm password should be same".localized()
    static let Email_Blank                                  = "من فضلك ادخل اسم المستخدم".localized()
    static let Email_Invalid                                = "Please enter valid email address".localized()
    static let Email_Exists                                 = "Email already exists".localized()
    static let FullName_Blank                               = "من فضلك ادخل اسم المستخدم".localized()
    static let Name_Blank                                   = "Please enter name".localized()
    static let AddressName_Blank                            = "Please enter name of address.".localized()
    static let AddressHouseNo_Blank                         = "Please enter House number.".localized()
    static let AddressBuildingName_Blank                    = "Please enter building name.".localized()
    static let AddressCity_Blank                            = "Please enter City.".localized()
    static let AddressState_Blank                           = "Please enter State.".localized()
    static let Pass_Blank                                   = "من فضلك ادخل كلمة المرور".localized()
    static let Pass_Length_Minimum                          = "كلمة المرور يجب ان تتعدى ٥ حروف"
    static let Pass_Length_Maximum                          = "كلمة المرور تعدت عدد الحروف المسموح".localized()
    static let Phone_Length_Maximum                         = "Phone number  length has reached to his limit".localized()
    static let Phone_Number                                 = "Please enter phone number".localized()
    static let Location_Blank                               = "Please enter location".localized()
    static let Pass_Link                                    = "An email will be sent to your Email address that includes a password reset link".localized()
    static let Logout                                       = "Are you sure you want to logout?".localized()
    static let NoInternet                                   = "Looks like you have no connection. Try connecting to Wi-Fi or a cellular network.".localized()
    static let Address_Blank                                = "Please select address".localized()
    static let Details_Blank                                = "Please enter detail".localized()
    static let Subject_Blank                                = "Please enter subject.".localized()
    static let ReferralCode                                 = "Please enter Valid Referral Code".localized()
    static let ReportType                                   = "Please select report type".localized()
}

struct ScreenSize {
    static let SCREEN_WIDTH                                 = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT                                = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH                            = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH                            = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct Chatting {
    static let Msg_Pagination                               = 20
}

struct DeviceType {
    
    static let IS_IPHONE_4_OR_LESS                          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5                                  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6                                  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P                                 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD                                      = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}


struct Version {
    static let SYS_VERSION_FLOAT                            = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS7                                         = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8                                         = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9                                         = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
}
struct FirstAidString {
    func burns(titleFontSize: CGFloat, textFontSize: CGFloat)-> NSMutableAttributedString {
        let titleFont = UIFont(name: "Droid Arabic Kufi", size: titleFontSize)
        let textFont = UIFont(name: "Droid Arabic Kufi", size: textFontSize)
        let firstTitle = NSMutableAttributedString(string: "الاسعافات الاولية للحروق: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let secondTitle = NSMutableAttributedString(string: " انواع الحروق: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let thirdTitle = NSMutableAttributedString(string: " الأعراض: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let fourthTitle = NSMutableAttributedString(string: "الإسعاف الأولية اللازمة: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let fifthTitle = NSMutableAttributedString(string: " الأعراض: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let sixthTitle = NSMutableAttributedString(string: " الاسعافات الاولية اللازمة: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let seventhTitle = NSMutableAttributedString(string: " الأعراض: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let ei8thTitle = NSMutableAttributedString(string: "الإسعاف الأولية اللازمة: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        var textString1 =  "وضع الجزء المصاب تحت جريان الماء البارد بارد خفيف أو غطسه في ماء بارد لمدة لا تقل عن عشرتترافق الحروق مع الالام الحادة، وتترك علامات ونتوءات على جسد الإنسان، من هنا ارتأينا في ويب طب ان نقدم أهم الإرشادات في الاسعافات الاولية للحروق بأنواعها المختلفة والتي قد تساهم في انقاذ شخص ما. \n"
        textString1.append("بداية الحرق عبارة عن تلف الأنسجة الموجودة في الجلد بسبب التعرض المفرط للشمس أو ملامسة النيران، المواد الكيميائية أو الكهرباء.\n")
        let textString2 = "تضع مرهم أو زبدة فقد يؤدي ذلك إلى التهاب الجرح أو تجرثمهتصنف أنواع وشدة الحروق إلى 3 أنواع وذلك وفقاً لمساحة الجلد المتأثرة وعمقها، فهناك الحروق من الدرجة الأولى، والثانية والثالثة، وهنا يجب ان نتعرف كيف نقوم بالإسعافات الاولية لكل نوع مما يساعد في التقليل من الاثار السيئة. \n"
        var textString3 = "تشمل علامات الحروق من الدرجة الأولى ما يلي: \n"
        textString3.append("•    وجود احمرار والتهاب طفيف أو تورم. \n")
        textString3.append("•    جفاف وتقشير الجلد. \n")
        textString3.append("تشفى الحروق من الدرجة الأولى في غضون 7 إلى 10 أيام دون أن تترك أي ندوب. \n")
        var textString4 = "يتم إسعاف هذا النوع من الحروق من خلال الاتي:\n"
        textString4.append("1.    ضع الجلد المحروق تحت الماء البارد حتى يخف الألم.\n")
        textString4.append("2.    استخدم كمادات إذا كان الماء الجاري غير متاح.\n")
        textString4.append("3.    حماية الحرق من خلال التغطية بضمادة معقمة أو قطعة قماش نظيفة.\n")
        textString4.append("4.    عليك طلب المساعدة الطبية إذا استمر الاحمرار والالم اكثر من بضع ساعات او اذا كان الحرق يؤثر على مساحة كبيرة من الجلد أي  أكثر من 7 سم.\n")
        textString4.append("2- الحروق من الدرجة الثانية\n")
        textString4.append("هذه الحروق أكثر عمقا حيث تتعدى الطبقة الخارجية للجلد لتصل إلى الطبقة الداخلية.\n")
        var textString5 = ""
        textString5.append("تلاحظ على الشخص المصاب ما يلي: \n")
        textString5.append("•    الحروق من هذه الدرجة مؤلمة جداً بسبب تلف جميع الاوعية الدموية الموجودة في طبقة الادمة.\n")
        textString5.append("•    تورم وإفراز سوائل من المنطقة المصابة.\n")
        var textString6 = "يتم إسعاف هذا النوع من الحروق من خلال: \n" +  "   1.    غمر المكان المصاب في الماء البارد او وضع منشفة نظيفة مبللة بالماء البارد، حيث يعمل الماء البارد على تخفيف الألم.  \n"  +
            "   2.    نزع الاكسسوارات والمجوهرات أو الملابس الضيقة عن المكان المصاب بلطف.  \n"  +
            "   3.    حاول أن تجعل المصاب يشرب كميات كبيرة من الماء ولكن دون ان يصل الى حد الغثيان. \n "  +
            "   4.    لا تستخدم الثلج لأنه يمكن أن يقلل درجة حرارة الجسم ويسبب المزيد من الألم والضرر. \n "  +
            "   5.    ضع الشخص المصاب مسطحاً مع رفع قدميه إلى الاعلى.  "  +
            "   6.    في حال وجود بثور أو فقاعات مغلقة لا تقم بفتحها، أما المفتوح منها غطيه بطبقة من المرهم وغطي المكان بمنشفة أو ضمادة غير لاصقة. \n "  +     "   7.    توجه لطلب المساعدة من المختص. \n"
        textString6.append( "  3- الحروق من الدرجة الثالثة \n "  +
            "   هي حروق تتغلغل في كل طبقات الجلد وصولاً إلى الدهن والعضلات.\n  " )
        
        let textString7 =  "   أما الأعراض الخاصة للحروق من هذه الدرجة فهي:  \n"  +
            "   •    يبدو الجلد مشمعاً أو رمادياً وأحياناً مفحما.  \n"  +
            "   •    لا يشعر المصاب بأي ألم في المكان؛ لأن أطراف الأعصاب تلفت وتدمرت.  \n"  +
        "   •    قد يحدث للمصاب ضيق في التنفس نتيجة استنشاق المواد والدخان الناتج عن الاحتراق . \n "
        let textString8 =  "   أما الأعراض الخاصة للحروق من هذه الدرجة فهي:  \n"  +
            "   •    يبدو الجلد مشمعاً أو رمادياً وأحياناً مفحما.  \n"  +
            "   •    لا يشعر المصاب بأي ألم في المكان؛ لأن أطراف الأعصاب تلفت وتدمرت.  \n"  +
        "   •    قد يحدث للمصاب ضيق في التنفس نتيجة استنشاق المواد والدخان الناتج عن الاحتراق . \n "
        let textString9 =  "   لا تحاول أبدا التعامل مع حروق الدرجة الثالثة، يتم الاتصال والتوجه لقسم الطوارئ فورا لتلقي العلاج الطبي، وتأكد من عدم وجود أي ملابس عالقة بمكان الحرق. \n" +
            "   حيث سيقوم الطاقم الطبي الخاص بقسم الطوارئ بالتعامل مع حالات الحروق حسب الاتي: \n" +
            "   1.    يتم تنظيف الحروق أولا و إزالة الأجزاء الميتة من الجزء المحروق من الجلد. \n" +
            "   2.    تزويد المريض بالمحاليل الوريدية وجرعات من المضاد الحيوي. \n" +
            "   3.    وضع كريم مضاد للبكتيريا فوق سطح الحرق تضميد الجروح. \n" +
            "   4.    إعطاء المريض أدوية مسكنة للألم. \n" +
            "   5.    يتم استكمال العلاج داخل قسم المختص وذلك لأن الحروق من الدرجة الثالثة تحتاج إلى وقت طويل لكي تشفى وقد يلجأ الأطباء إلى التدخل الجراحي. \n" +
            "   أخطاء شائعة في علاج الحروق وطرق تجنبيها \n" +
            "   قد يرتكب كثير من الأشخاص مجموعة من الأخطاء عند حصول الحرق إليكم أهمها: \n" +
            "   1. معجون الأسنان \n" +
            "   من أبرز الأخطاء التي لا يجوز ارتكابها عند حصول حرق هي المسارعة لفرك المنطقة المصابة بمعجون الأسنان، الزبدة أو رب الطماطم. \n" +
            "   هذه المواد تحبس الحرارة داخل الجلد وتمنعه من التنفس ما يزيد من مساحة المنطقة المحروقة ويسبب المضاعفات الخطرة. \n" +
            "   2. عدم استخدام الثلج فوق الحرق \n" +
            "   لا شك أن المكعبات الثلجية هي من الوسائل التي تخفف من ألم الحرق ولكن لا يجوز وضعها مباشرةً على الجلد. \n" +
            "   يمكن أن يؤدي ذلك إلى تلف الانسجة المحيطة بمنطقة الحرق كما أنها تترك ندبات واثار على الجلد. لتصحيح ذلك الخطأ  يجب أن يوضع الثلج في كيس بلاستيكي أو في منشفة صغيرة. \n" +
            "   3. استخدام القطن لتغطية الجرح \n" +
            "   إذا وضعت القطن بشكل مباشر على الجرح الناتج عن الحروق فإن قطع القطن سوف تلتصق بالجرح و تصعب عملية تغيير الجرح بعد ذلك، من الأفضل أن تستبدل القطن بالشاش فهو أخف على الجرح. \n" +
            "   4. لمس مكان الحرق بأيدي مكشوفة \n" +
            "   بما أن الحرق يسبب تلف بعض أو كل طبقات الجلد فإن لمس مكانه بأيدينا قد يسبب في تلوثه أو إصابته بالعدوى نظرا لهشاشة وحساسية الجلد في هذه الحالة لذلك يعد لمس أماكن الحروق خطرا و خطأ وجب تجنبه. \n" +
            "   5. فرقعة الفقاعات الناتجة عن الحرق \n" +
            "   تنتج عن الحروق الشديدة أو الحروق من الدرجة الثانية فأكثر تكون فقاعات مليئة بسوائل و التي من الخطأ القيام بفرقعتها تفاديا لأي عدوى قد يصاب بها المصاب. \n" +
        "    " ;
        
        let text1 = NSMutableAttributedString(string: textString1, attributes: [NSAttributedString.Key.font: textFont!])
        let text2 = NSMutableAttributedString(string: textString2, attributes: [NSAttributedString.Key.font: textFont!])
        let text3 = NSMutableAttributedString(string: textString3, attributes: [NSAttributedString.Key.font: textFont!])
        let text4 = NSMutableAttributedString(string: textString4, attributes: [NSAttributedString.Key.font: textFont!])
        let text5 = NSMutableAttributedString(string: textString5, attributes: [NSAttributedString.Key.font: textFont!])
        let text6 = NSMutableAttributedString(string: textString6, attributes: [NSAttributedString.Key.font: textFont!])
        let text7 = NSMutableAttributedString(string: textString7, attributes: [NSAttributedString.Key.font: textFont!])
        let text8 = NSMutableAttributedString(string: textString8, attributes: [NSAttributedString.Key.font: textFont!])
        let text9 = NSMutableAttributedString(string: textString9, attributes: [NSAttributedString.Key.font: textFont!])
        
        let attributedString = firstTitle
        attributedString.append(text1)
        attributedString.append(secondTitle)
        attributedString.append(text2)
        attributedString.append(thirdTitle)
        attributedString.append(text3)
        attributedString.append(fourthTitle)
        attributedString.append(text4)
        attributedString.append(fifthTitle)
        attributedString.append(text5)
        attributedString.append(sixthTitle)
        attributedString.append(text6)
        attributedString.append(seventhTitle)
        attributedString.append(text7)
        attributedString.append(ei8thTitle)
        attributedString.append(text8)
        attributedString.append(seventhTitle)
        attributedString.append(text9)
        return attributedString
        
    }
    func sunBurns(titleFontSize: CGFloat, textFontSize: CGFloat)-> NSMutableAttributedString {
        let titleFont = UIFont(name: "Droid Arabic Kufi", size: titleFontSize)
        let textFont = UIFont(name: "Droid Arabic Kufi", size: textFontSize)
        let firstTitle = NSMutableAttributedString(string: "  الحروق\n", attributes: [NSAttributedString.Key.font: titleFont!])
        let secondTitle = NSMutableAttributedString(string: " مقدمة:  \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let thirdTitle = NSMutableAttributedString(string: " أسباب الحروق: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let fourthTitle = NSMutableAttributedString(string: "متى يجب الذهاب للطبيب: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let fifthTitle = NSMutableAttributedString(string: " أنواع الحروق: \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let sixthTitle = NSMutableAttributedString(string: " حروق الجلد السطحية (حروق الدرجة الأولى): \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let seventhTitle = NSMutableAttributedString(string: "حروق الجلد ذات السماكة الجزئية (حروق الدرجة الثانية): \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let eighthTitle = NSMutableAttributedString(string: "حروق الجلد العميقة الجزئية (حروق الدرجة الثالثة): \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let ninthTitle = NSMutableAttributedString(string: " حروق بسمك كامل (حروق الدرجة الرابعة):  \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let tenthTitle = NSMutableAttributedString(string: " علاج حروق الجلد:  \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let eleventhTitle = NSMutableAttributedString(string: " متابعة الحروق:  \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let twelvethTitle = NSMutableAttributedString(string: "  الوقاية من الحروق:  \n", attributes: [NSAttributedString.Key.font: titleFont!])
        
        
        let textString1 =   " الحروق تلف يحدث لأنسجة الجسم؛ بسبب تعرضها لحرارة حارقة، أو لحرارة أشعة الشمس لفترة طويلة، أو لمادة كيميائية، أو تيار كهربائي، أو غيرها من مسببات الحروق. وتُعد إصابات الحروق الجلدية من الإصابات الشائعة. كما أن معظم حروق الجلد تكون بسيطة، ويمكن علاجها بالمنزل. ومع ذلك، من المهم معرفة علامات الحروق الجلدية الأكثر خطورة التي يجب تقييمها وعلاجها بوساطة مقدم الرعاية الصحية؛ حيث يمكن أن تتسبب الحروق المتوسطة والشديدة في عدد من المضاعفات الخطيرة، وتتطلب علاجًا عاجلًا. \n"
        
        let textString2 =  "   •    الماء الساخن، البخار، الأجسام الساخنة.  \n"  +
            "   •    النار.  \n"  +
            "   •    المواد الكيميائية.  \n"  +
            "   •    الكهرباء.  \n"  +
        "   •    التعرض المفرط لأشعة الشمس.  \n"
        let textString3 = "   •    إذا كان الحرق يشمل الوجه، اليدين، الأصابع، الأعضاء التناسلية، أو القدمين. \n"  +
            "   •    إذا كان الحرق على مفصل، أو بالقرب منه، مثل: مفصل الركبة، الكتف، الفخذ. \n"  +
            "   •    إذا كان الحرق يطوق جزءًا من الجسم، مثل: الذراع، الساق، القدم، الصدر، الإصبع. \n"  +
            "   •    إذا كان الحرق كبيرًا، يزيد على 7 سم، أو كان الحرق عميقًا. \n"  +
            "   •    إذا كان العمر أقل من 5 سنوات، أو أكثر من 70 سنة. \n"  +
        "   •    عند وجود علامات للعدوى الجلدية، مثل: زيادة الاحمرار، الألم، إفرازات تشبه القيح(الصديد)، أو عند ارتفاع درجة الحرارة إلى أكثر من 38 درجة مئوية.  \n"
        let textString4 = "يتم تصنيف الحروق على درجات، استنادًا إلى سمك الجلد المحروق. ومن الممكن أن يتغير تصنيف الحرق خلال الأيام القليلة الأولى، بمعنى أن الحرق قد يبدو سطحيًّا في البداية، ثم يصبح أعمق بمرور الوقت.\n"
        
        let textString5 = "تتضمن حروق الجلد السطحية الطبقة العليا من الجلد فقط، وتكون مؤلمة، وجافة وحمراء، وتتحول إلى اللون الأبيض عند الضغط عليها. وتلتئم حروق الجلد السطحية خلال فترة تتراوح بين ثلاثة وستة أيام دون أن تترك ندبات، مثل: حروق أشعة الشمس التي لا ينتج عنها بثور(فقاعات). \n"
        let textString6 = "يشمل الحرق الطبقتين العلويتين من الجلد. وتكون هذه الحروق مؤلمة عند تعرضها للهواء، ولونها أحمر، وعادة ما تشكل بثورًا، وتتحول إلى اللون الأبيض عند الضغط عليها. وتلتئم حروق الجلد السطحية الجزئية خلال فترة تتراوح بين سبعة أيام و21 يومًا. وقد تصبح المنطقة المحروقة أغمق، أو أفتح لونًا بشكل دائم، ولكنها لا تكون ندبة، مثل: حروق أشعة الشمس التي تحدث انتفاخات، أو تخلف بثورًا بالجلد. \n"
        let textString7 = "تكون أعمق في الجلد، ومؤلمة عند الضغط العميق عليها؛ حيث تشكل بثورًا، لكنها لا تتحول إلى اللون الأبيض بالضغط عليها. وتلتئم حروق الجلد العميقة بعد أكثر من 21 يومًا، وعادة ما تترك ندبة شديدة. كما تُعد الحروق التي يصحبها انتفاخ على الفور، مع بثور، والحروق التي تكون بثورًا، وتستمر لعدة أسابيع، حروقًا عميقة بسمك جزئي.\n"
        let textString8 = "تمتد حروق الجلد بسمك كامل عبر جميع طبقات الجلد؛ مما يؤدي إلى تدمير جميع هذه الطبقات. كما أن المنطقة المحروقة عادة لا تؤلم، وتكون بيضاء شمعية إلى رمادية اللون، أو سوداء متفحمة. وتكون البشرة جافة، ولا تتحول إلى اللون الأبيض عند لمسها. كما لا يمكن للحروق بسمك كامل أن تلتئم دون علاج جراحي، وعادة ما تترك ندبة شديدة. \n"
        
        var textString9 =  "  يمكن علاج الحروق الصغيرة السطحية، والسطحية الجزئية في المنزل. أما الحروق الأكبر والأعمق فيجب تقييمها وعلاجها من قبل مقدم الرعاية الصحية؛ حيث يشمل العلاج المنزلي لحروق الجلد تنظيف المنطقة، وتبريدها على الفور، ومنع العدوى، والتحكم بالألم، والتي تتم بما يلي:\n "
        textString9.append( "  •    تنظيف المنطقة:  \n" +
            "  o    القيام بإزالة أي ملابس من المنطقة المحروقة، لكن إذا التصقت الملابس بالجلد، فيجب التوجه للطبيب على الفور لإزالتها.  \n" +
            "  o    إزالة الإكسسوارات، مثل: الخواتم، الساعات، الأحزمة، الأحذية إن وجدت برفق.  \n" +
            "  o    غسل الجلد المحروق بلطف بماء جارٍ من الصنبور، على أن يكون باردًا، وليس من الضروري تطهير الجلد بالكحول، أو اليود، أو المطهرات الأخرى.  \n" +
            "  •    تبريد المنطقة المصابة:  \n" +
            "  o    بعد تنظيف الجلد، يمكن وضع ضغط بارد عليه، أو نقع المنطقة في ماء بارد، وليس في ثلج، لفترة زمنية قصيرة؛ لتخفيف الألم، وتقليل مدى الاحتراق.  \n" +
            "  o    تجنب وضع الثلج مباشرة على الجلد؛ لأن ذلك قد يؤدي إلى تلف الجلد بشكل أكبر.  \n" +
            "  •    منع العدوى:  \n" +
            "  o    يمكن منع العدوى في حالة الحروق السطحية الجزئية، أو الحروق الشديدة باستخدام الصبار، أو وضع كريم مضاد حيوي على المنطقة المصابة.  \n" +
            "  o    تجنب وضع المواد الأخرى، مثل: الخردل، معجون الأسنان، بياض البيض، زيت اللافندر، الزبدة، المايونيز.  \n" +
            "  o    المحافظة على نظافة موضع الحرق عن طريق غسلها يوميًّا بالماء والصابون.  \n" +
            "  o    تغطية الحروق التي تصاحبها بثور بضمادة نظيفة، ويفضل من النوع الذي لا يلتصق بالجلد، مثل: ضمادة غير لاصقة، أو شاش فازلين. كما يمكن تغطية الحروق البسيطة عند الرغبة بذلك بضمادة نظيفة.  \n" +
            "  o    يجب تغيير الضمادة مرة أو مرتين يوميًّا، مع تجنب فتح البثور المتكونة بإبرة؛ لأن ذلك يزيد من خطر الإصابة بالتهاب الجلد.  \n" +
            "  •    الوقاية من التيتانوس (الكزاز):  \n" +
            "  إذا كان قد مر على آخر جرعة تم أخذها من لقاح التيتانوس أكثر من 5 سنوات، فيجب أخذ جرعة تعزيزية من اللقاح، وذلك إذا كان الحرق سميكًا جزئيًّا، أو أعمق من ذلك.  \n" +
            "  •    معالجة الألم:  \n" +
            "  o    رفع منطقة الحروق التي في اليد، أو القدم إلى ما فوق مستوى القلب، يمكن أن يساعد في منع التورم والألم.  \n" +
            "  o    تناول دواء؛ لتخفيف الألم، مثل: الأسيتامينوفين، أو الأيبوبروفين عند الحاجة.  \n" +
            "  o    إذا كان الحرق شديدًا، أو لم يخف الألم باستخدام الأدوية السابقة، فيجب استشارة الطبيب.  \n" +
            "  o    لا يجب استخدام مواد التخدير الموضعي بانتظام على الحروق؛ لأنها تسبب تهيجًا بالجلد.  \n" +
            "  •    خدش الجلد:  \n" +
            "  من الطبيعي أن تحدث حكة عند بداية شفاء الحرق؛ لذلك تجنب محاول خدش الجلد. كما يمكن استخدام مرطب، أو مضادات الهيستامين إذا لزم الأمر.\n  ")
        let textString10 = "   •    إذا لم يشف الحرق، أو عند انتشار احمرار بالمنطقة التي حوله بما يزيد على 2 سم، فيجب مراجعة الطبيب.  \n"  +
            "   •    معظم الحروق الجلدية الصغيرة، والسطحية تلتئم خلال أسبوع واحد، ولن تكون ندبة عادة.  \n"  +
        "   •    قد يصبح الجلد بعد الحروق ذات السماكة الجزئية أغمق، أو أفتح في اللون، ولكنه عادة ما يترك ندبة.  \n"
        
        let textString11 = "   •    تجنب التعرض لأشعة الشمس في منتصف اليوم، منذ الساعة 10 صباحًا إلى الساعة 4 عصرًا؛ لتجنب حروق أشعة الشمس.  \n"  +
            "   •    وضع الشموع المضاءة، والقداحات (الولاعات)، وأعواد الكبريت بعيدًا عن متناول الأطفال.  \n"  +
            "   •    وضع الأطعمة، والمشروبات الساخنة، والمكواة الكهربائية، بعيدًا عن أطراف الطاولة.  \n"  +
            "   •    الحرص على بقاء الأطفال بعيدًا عن المواقد الساخنة، والمدافئ، والأفران.  \n"  +
            "   •    يفضل الطبخ على الشعلات الخلفية للأفران قدر الإمكان، ولا يجب حمل الأطفال في أثناء طهو الطعام.  \n"  +
            "   •    تركيب كاشف للدخان في كل أنحاء المنزل، والتأكد من جودته كل شهر.  \n"  +
            "   •    ضبط درجة حرارة ترموستات سخانات المياه؛ بحيث لا تزيد على 49 درجة مئوية.  \n"  +
        "   •    تغطية جلد مقاعد السيارة، خصوصًا مقاعد الأطفال، بغطاء واقٍ من أشعة الشمس في الصيف، مع تجنب ترك السيارة في مكان حار دون تظليل.  \n"
        let text1 = NSMutableAttributedString(string: textString1, attributes: [NSAttributedString.Key.font: textFont!])
        let text2 = NSMutableAttributedString(string: textString2, attributes: [NSAttributedString.Key.font: textFont!])
        let text3 = NSMutableAttributedString(string: textString3, attributes: [NSAttributedString.Key.font: textFont!])
        let text4 = NSMutableAttributedString(string: textString4, attributes: [NSAttributedString.Key.font: textFont!])
        let text5 = NSMutableAttributedString(string: textString5, attributes: [NSAttributedString.Key.font: textFont!])
        let text6 = NSMutableAttributedString(string: textString6, attributes: [NSAttributedString.Key.font: textFont!])
        let text7 = NSMutableAttributedString(string: textString7, attributes: [NSAttributedString.Key.font: textFont!])
        let text8 = NSMutableAttributedString(string: textString8, attributes: [NSAttributedString.Key.font: textFont!])
        let text9 = NSMutableAttributedString(string: textString9, attributes: [NSAttributedString.Key.font: textFont!])
        let text10 = NSMutableAttributedString(string: textString10, attributes: [NSAttributedString.Key.font: textFont!])
        let text11 = NSMutableAttributedString(string: textString11, attributes: [NSAttributedString.Key.font: textFont!])
        
        let attributedString = firstTitle
        attributedString.append(secondTitle)
        attributedString.append(text1)
        attributedString.append(thirdTitle)
        
        attributedString.append(text2)
        attributedString.append(fourthTitle)
        
        attributedString.append(text3)
        attributedString.append(fifthTitle)
        
        attributedString.append(text4)
        attributedString.append(sixthTitle)
        
        attributedString.append(text5)
        attributedString.append(seventhTitle)
        
        attributedString.append(text6)
        attributedString.append(eighthTitle)
        
        attributedString.append(text7)
        attributedString.append(ninthTitle)
        
        attributedString.append(text8)
        attributedString.append(tenthTitle)
        
        attributedString.append(text9)
        attributedString.append(eleventhTitle)
        
        attributedString.append(text10)
        attributedString.append(twelvethTitle)
        attributedString.append(text11)
        return attributedString
        
    }


func bloodPressure(titleFontSize: CGFloat, textFontSize: CGFloat)-> NSMutableAttributedString {
   
    let titleFont = UIFont(name: "Droid Arabic Kufi", size: titleFontSize)
    let textFont = UIFont(name: "Droid Arabic Kufi", size: textFontSize)
    let firstTitle = NSMutableAttributedString(string:  "حالات ارتفاع ضغط الدم الخطيرة  \n" +
        "تعرف على أهم نوعين من الحالات الخطيرة لارتفاع ضغط الدم:  \n"
        , attributes: [NSAttributedString.Key.font: titleFont!])
    
    let secondTitle = NSMutableAttributedString(string: "تشمل الأضرار التي تتعرض لها الأعضاء الداخلية نتيجة لارتفاع ضغط الدم:\n"
        , attributes: [NSAttributedString.Key.font: titleFont!])
    let thirdTitle = NSMutableAttributedString(string: "تشخيص ارتفاع ضغط الدم الذي يتطلب العلاج الطارئ والفوري\n"
        , attributes: [NSAttributedString.Key.font: titleFont!])
    let textString1 = "ينطوي ارتفاع ضغط الدم (فرط ضغط الدم - Hypertension) على العديد من الحالات الطبية التي تتطلب تقديم العلاج الفوري، بل يعتبر بعضها حالات طبية طارئة، وذلك عندما تصبح قيم ضغط الدم مرتفعة بشكل خطير، مما قد يؤدي إلى إلحاق الضرر بالأعضاء الداخلية في الجسم.\n"
    let textString2 = "   1.    ارتفاع ضغط الدم الذي يتطلب العلاج العاجل: هو ضغط الدم الذي يرتفع بسرعة، دون أن يلحق الضرر بالأعضاء الداخلية في الجسم، ويمكن خفضه وإعادته إلى القيم الطبيعية في غضون بضع ساعات، عن طريق تقديم علاج ارتفاع ضغط الدم الدوائي المناسب.  \n"  +
    "  2.    ارتفاع ضغط الدم الذي يتطلب العلاج الطارئ والفوري: عندما يؤدي ارتفاع ضغط الدم إلى إلحاق الضرر بالأعضاء الداخلية في الجسم، نتيجة لقيم الضغط المرتفعة، فإن ذلك يعتبر حالة طارئة تستدعي العلاج الفوري. في هذه الحالة، ينبغي خفض قيم ضغط الدم من أجل منع تفاقم الضرر الذي لحق بالأعضاء الداخلية.  \n"
    let textString3 = "   •    تغييرات في حالة الوعي، مثل الإرتباك أو الغيبوبة (الإعتلال الدماغي - Encephalopathy) \n "  +
        "   •    نزيف داخل الدماغ (حادثة وعائية دماغية) \n "  +
        "   •    فشل القلب \n "  +
        "   •    الام في منطقة الصدر (الذبحة الصدرية) \n "  +
        "   •    تراكم السوائل في الرئتين (الوذمة الرئوية Pulmonary edema) \n "  +
        "   •    السكتة القلبية (إحتشاء عضلة القلب MI) \n "  +
        "   •    تمدد أو توسع الاوعية الدموية (Aneurysm) \n "  +
        "   •    مقدمة الإرتعاج لدى النساء الحوامل (Preeclampsia) \n "  +
        "   لحسن الحظ، تعتبر الحالات التي تستدعي علاج ارتفاع ضغط الدم العلاج بشكل طارئ حالات طبية نادرة الحدوث. وهي تحدث غالباً لدى الأشخاص الذين لا يعالجون ارتفاع ضغط الدم لديهم، مما يخرجه عن السيطرة، أو في الحالات التي لا يتناول فيها المريض العلاج الدوائي المعد لخفض ضغط الدم. \n "  +
        "   ارتفاع ضغط الدم الذي يتطلب العلاج الطارئ والفوري \n "  +
        "   إليك أهم أعراض الإصابة بضغط الدم الذي يستدعي تقديم علاج طارئ وفوري، إلى جانب الفحوصات المتوفرة لذلك وأهم العلاجات \n "  +
        "    \n "  +
        "   أعراض ارتفاع ضغط الدم التي تستدعي تقديم علاج طارئ وفوري \n "  +
        "   تعرف على أهم أعراض ارتفاع ضغط الدم التي تستعدي العلاج الطارئ والفوري: \n "  +
        "   1.    الصداع \n "  +
        "   2.    نوبات الصرع \n "  +
        "   3.    الالام في الصدر \n "  +
        "   4.    ضيق التنفس \n "  +
        "   5.    التورم أو الوذمات (السوائل التي تتراكم في الانسجة) \n "  +
    "    "
    let textString4 = "   من أجل تشخيص ارتفاع ضغط الدم الذي يتطلب العلاج الطارئ والفوري، يقوم الطبيب المعالج بتوجيه عدد من الأسئلة إلى المريض حول تاريخه الطبي، وذلك من أجل توضيح صورة الوضع.  \n"  +
        "   كما يقوم بالاستفسار عن العلاجات الدوائية التي يتناولها، بما في ذلك الادوية التي تباع في الصيدليات بدون وصفة طبية. إضافة إلى ذلك، يسأل الطبيب عما إذا كان المريض يتعاطى المخدرات.  \n"  +
        "   ينبغي، بل من الضروري، إبلاغ الطبيب المعالج بشأن تناول أدوية لخفض الوزن أو بدائل معينة على أساس نباتي.  \n"  +
        "   بعد ذلك، يطلب الطبيب إجراء عدد من الفحوصات من أجل متابعة قيم ضغط الدم لدى المريض ومن أجل معرفة ما إذا كان قد لحق ضرر ما بأي من الأعضاء الداخلية، ولتقييم مدى هذا الضرر.  \n"  +
        "   هذه الفحوصات يمكن أن تشمل:  \n"  +
        "   •    قياس قيم ضغط الدم بشكل منتظم.  \n"  +
        "   •    فحص قاع العين (Fundus) من أجل تشخيص وجود تورم أو نزيف.  \n"  +
        "   •    فحوصات الدم والبول.  \n"  +
        "   علاج ارتفاع ضغط الدم الطارئ والفوري  \n"  +
        "   في حالات فرط ضغط الدم التي تتطلب العلاج الطارئ والفوري، يكون الهدف الرئيسي أولاً وأخيراً خفض ضغط الدم وإعادته إلى مستوياته الطبيعية، في أسرع وقت ممكن، عن طريق تسريب أدوية لخفض ضغط الدم عبر الوريد، من أجل منع حصول تفاقم وضرر للأعضاء الداخلية.  \n"  +
        "   يتم علاج اي ضرر حاصل في الأعضاء الداخلية بموجب الأساليب العلاجية المتبعة لمعالجة العضو المصاب.  \n"  +
    "    "
    let text1 = NSMutableAttributedString(string: textString1, attributes: [NSAttributedString.Key.font: textFont!])
    let text2 = NSMutableAttributedString(string: textString2, attributes: [NSAttributedString.Key.font: textFont!])
    let text3 = NSMutableAttributedString(string: textString3, attributes: [NSAttributedString.Key.font: textFont!])
    let text4 = NSMutableAttributedString(string: textString4, attributes: [NSAttributedString.Key.font: textFont!])
    let attributedString = text1
    attributedString.append(firstTitle)
    attributedString.append(text2)
    attributedString.append(secondTitle)
    attributedString.append(text3)
    attributedString.append(thirdTitle)
    attributedString.append(text4)
    return attributedString
    }


    func corona(titleFontSize: CGFloat, textFontSize: CGFloat)-> NSMutableAttributedString {
        let titleFont = UIFont(name: "Droid Arabic Kufi", size: titleFontSize)
        let textFont = UIFont(name: "Droid Arabic Kufi", size: textFontSize)
        let firstTitle = NSMutableAttributedString(string: "  فيروس كورونا\n", attributes: [NSAttributedString.Key.font: titleFont!])
        let secondTitle = NSMutableAttributedString(string: "ما هي الأعراض؟ :  \n", attributes: [NSAttributedString.Key.font: titleFont!])
        let thirdTitle = NSMutableAttributedString(string: " كيف تحمي نفسك من الإصابة؟: \n", attributes: [NSAttributedString.Key.font: titleFont!])
 
        
        
        let textString1 =   " تبدأ الأعراض بحمى، متبوعة بسعال جاف، وبعد نحو أسبوع، يشعر المصاب بضيق في التنفس، مما يستدعي علاج بعض المرضى في المستشفى. ونادرًا ما تأتي الأعراض في صورة عطس أو سيلان مخاطى من الأنف"
            
 +   "  ولا تعني ظهور تلك الأعراض بالضرورة أنك مصاب بالمرض، فهي أعراض تشبه تلك المصاحبة لأنواع الفيروسات الأكثر شيوعًا، مثل نزلات البرد والإنفلونز"
        
   + "ويمكن أن يسبب فيروس كورونا، في حالات الإصابة الشديدة، الالتهاب الرئوي، ومتلازمة الالتهاب الرئوي الحاد، وقصور في وظائف بعض من أعضاء الجسم وحتى الوفاة" +
        
      "  ويكون كبار السن والأشخاص الذين يعانون من ظروف صحية سابقة (مثل الربو والسكري وأمراض القلب) هم الفئة الأكثر عُرضة للإصابة الشديدة بالفيروس" +
 
      "  وتستمر فترة حضانة الفيروس - ما بين الإصابة وظهور الأعراض حوالي 14 يومًا وفقًا لمنظمة الصحة العالمية لكن بعض الباحثين يقولون إن هذه الفترة قد تستمر حتى 24 يومًا  . \n"
        
        
        let textString2 =  "   • غسل اليدين جيدًا وبإنتظام بالماء و الصابون لأان ذلك أمر بالغ الأهمية ويساعد على قتل الفيروسات وتجنب العدوى بالمرض .  \n"  +
            "   •  تغطية الفم والأنف عند العطس أو السعال وغسل اليدين بعدها لمنع انتشار الفيروس.  \n"  +
            "   •    تجنب لمس العينين والأنف والفم حال ملامسة اليد لسطح يُرجح وجود الفيروس عليه إذ يمكن أن ينتقل الفيروس إلى الجسم بهذه الطريقة .  \n"  +
            "   •    لا تقترب من المصابين بالسعال أو العطس أو الحمى و يُفضل الابتعاد عنهم لمسافة لا تقل عن متر.  \n"
        
        
        let text1 = NSMutableAttributedString(string: textString1, attributes: [NSAttributedString.Key.font: textFont!])
        let text2 = NSMutableAttributedString(string: textString2, attributes: [NSAttributedString.Key.font: textFont!])
      
        let attributedString = firstTitle
        attributedString.append(secondTitle)
        attributedString.append(text1)
        attributedString.append(thirdTitle)
        
        attributedString.append(text2)
   
        return attributedString
        
    }


}
