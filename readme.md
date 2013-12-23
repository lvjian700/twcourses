Thoughtworks Courses App.

#For Development

##Requirements

* xcode5 
* [cocoapods](http://beta.cocoapods.org/?q=MBpro): Objective C 下的依赖管理工具,类似ruby中得gem. 

##set up

	git clone https://github.com/lvjian700/twcourses.git
	cd twcourses
	pod install
	open twcourses.xcworkspace

##Conventions

* 一个Story一个Storyboard文件，避免多人修改同一个Storyboard,避免git merge. 
* 所有storyboard放到storyboards group下
* 所有 #define 以__TW__开头,并且#define 放到 _utils/TWDefines.h_ 中.

##Libraries

See Podfile

* [RestKit](https://github.com/RestKit/RestKit): REST-ful 客户端
* [Reachability](https://github.com/tonymillion/Reachability): 网络监测,监测wifi, 2G/3G, 无网络状态。 
* [MBProgressHUD](https://github.com/jdg/MBProgressHUD): 进度提示组件
* [FMDB](https://github.com/ccgus/fmdb): SQLite Client SDK Improve.

