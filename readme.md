Thoughtworks Courses App.	

#For Development

##Requirements
---

* xcode5 
* [cocoapods](http://beta.cocoapods.org/?q=MBpro): Objective C 下的依赖管理工具,类似ruby中得gem. 

##set up
---

	git clone https://github.com/lvjian700/twcourses.git
	cd twcourses
	pod install
	open twcourses.xcworkspace

App Back-end Server	
<https://github.com/zhengjianing/TWCourse>

##Conventions
---

* 一个Story一个Storyboard文件，避免多人修改同一个Storyboard,避免git merge. 
* 所有storyboard放到storyboards group下
* 所有 #define 以__TW__开头,并且#define 放到 _utils/TWDefines.h_ 中.
* 日志使用DLog, 不要使用NSLog. DLog定义在 _twcourses-Prefix.pch_ 中.

##Libraries
---

See Podfile

* [RestKit](https://github.com/RestKit/RestKit): REST-ful 客户端
* [Reachability](https://github.com/tonymillion/Reachability): 网络监测,监测wifi, 2G/3G, 无网络状态。 
* [MBProgressHUD](https://github.com/jdg/MBProgressHUD): 进度提示组件
* [FMDB](https://github.com/ccgus/fmdb): SQLite Client SDK Improve.

##API Conventions
---

所有API以 _http://hostname:port/api/_ 开始

	var course = {
		_id: '',
		name: '',
		author: '',
		overview: '',
		coverImagePath: '',
		created_at: date,
		chapters: [{
			_id: '',
			name: '',
			chapterNumber: integer,
			videoPath: '',
			videoLength: 0,//sec
			assignmentPath: '',
			codePath: '',
			created_at: date
		}, {
			_id: '',
			name: '',
			chapterNumber: integer,
			videoPath: '',
			videoLength: 0,//sec
			assignmentPath: '',
			codePath: '',
			created_at: date
		}]
	}
	

###所有课程列表

url: courses/	

	var course = {
		_id: '',
		name: '',
		author: '',
		overview: '',
		coverImagePath: '',
		created_at: date
	}

###课程详细信息，包含章节列表

url: courses/:name  
parameter:	
* name: 章节名称		 

	{
		_id: '',
		name: '',
		author: '',
		overview: '',
		coverImagePath: '',
		created_at: date,
		chapters: [{
			_id: '',
			name: '',
			chapterNumber: integer,
			videoPath: '',
			videoLength: 0,//sec
			assignmentPath: '',
			codePath: '',
			created_at: date
		}, {
			_id: '',
			name: '',
			chapterNumber: integer,
			videoPath: '',
			videoLength: 0,//sec
			assignmentPath: '',
			codePath: '',
			created_at: date
		}]
	}	



	



