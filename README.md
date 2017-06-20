###目录
* [**前言**](#前言)
* [**准备工作**](#准备工作)
* [**使用方法**](#使用方法)
* [**shell脚本方式**](#shell脚本方式)
* [**总结**](#总结)


###<a name="前言"></a>前言
相信很多人跟我一样，对懒加载又爱又恨！爱的是他的规范性，代码可读性；恨的是你至少要多花费10分钟的时间来不停的写 "get" 函数；我这急性子可受不了这样的事情。于是我忍不住了，自己写了个插件，[GitHub 地址](https://github.com/developeryh/YHLazyCode),就有了今天的这篇博客，分享给大家，希望能有所帮助。


###<a name="准备工作"></a>准备工作
* 点击👆的GitHub 地址到仓库，把工程download 下来![屏幕快照 2017-06-16 下午3.26.50.png](http://upload-images.jianshu.io/upload_images/1891685-aef6ffadddd020d2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 运行工程后，复制如下图中的**.app**文件到应用程序中。（因有小伙伴反应下载下来的工程直接运行会出错（因为需要修改bundle id）,所以工程文件的根目录上我已经上传了个.app 文件，直接复制该文件即可，不需要麻烦的再运行工程）![屏幕快照 2017-06-16 下午3.27.03.png](http://upload-images.jianshu.io/upload_images/1891685-664016ddbb784f5b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)![屏幕快照 2017-06-16 下午3.33.32.png](http://upload-images.jianshu.io/upload_images/1891685-c0e9a2c2a7f0d3a1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240) 
* 找到刚刚复制进去的app，双击即可
![屏幕快照 2017-06-16 下午3.33.46.png](http://upload-images.jianshu.io/upload_images/1891685-1b0b19608dc12e3e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 确认 "系统偏好设置-->扩展"中对应的plugin 是否勾选!然后重启xcode 即可生效。![屏幕快照 2017-06-16 下午3.35.27.png](http://upload-images.jianshu.io/upload_images/1891685-4a79cc1784c0ceb8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


###<a name="使用方法"></a>使用方法
* 首先需要在当前文件任意位置写上"#pragma mark - Get and Set" 这行代码，一般推荐写在文件end 的上面
![屏幕快照 2017-06-16 下午3.41.12.png](http://upload-images.jianshu.io/upload_images/1891685-8137244a7bb8626b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 选中你想要的property,如下图
![屏幕快照 2017-06-16 下午3.40.39.png](http://upload-images.jianshu.io/upload_images/1891685-60f24743b171242f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* Editor 中找到刚安装的插件，点击确认
![屏幕快照 2017-06-16 下午3.41.00.png](http://upload-images.jianshu.io/upload_images/1891685-968be8db7838897e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
* 会自动生成如下的懒加载代码![屏幕快照 2017-06-16 下午3.42.48.png](http://upload-images.jianshu.io/upload_images/1891685-cb2f3981b306841b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 当然你可以在Xcode-->preferences-->key bindings 中搜索该插件找到并添加快捷键,当然要注意不要和Xcode本身的快捷键冲突了。![屏幕快照 2017-06-16 下午3.48.35.png](http://upload-images.jianshu.io/upload_images/1891685-4884238a4f205fc4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###<a name="shell脚本方式"></a>shell脚本方式
如果你觉得以上的插件方式前奏太多，不适合你的话，那么你可以试试脚本的方式。
YHLazyCodeShell 文件夹中还有独立于插件的脚本，如里面例子所示，在property.txt 文件中粘贴你想要格式化的property。切换到run.sh的目录下，执行run.sh，即可在out.txt中得到想要的懒加载代码。（要记得给shell脚本运行的权限：chmod + x）。在这里就不贴图片了，个人感觉还是插件的方式比较顺哈！

###<a name="总结"></a>总结
目前是第一版，有bug,有建议的欢迎留言。喜欢的话顺手帮忙点个赞吧～
