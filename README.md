简体中文 | [English](./README.en.md)

![(logo)](https://avatars2.githubusercontent.com/u/15794032?s=460&v=4)

# LMJVerticalScrollText

![podversion](https://img.shields.io/cocoapods/v/LMJVerticalScrollText.svg?style=flat)
![](https://img.shields.io/cocoapods/p/LMJVerticalScrollText.svg?style=flat)
![](https://img.shields.io/badge/language-oc-orange.svg)
![](https://img.shields.io/cocoapods/l/LMJVerticalScrollText.svg?style=flat)

- 一个简单好用的字符串滚动控件

![无间隙从下到上循环滚动](https://github.com/MajorLMJ/LMJVerticalScrollText/raw/master/demo1.gif)        
![有间隙从上到下循环滚动](https://github.com/MajorLMJ/LMJVerticalScrollText/raw/master/demo2.gif)

## 支持哪些场景
- UIView、UITableViewCell、Storyboard 等...

## 使用
* 使用cocoapods安装：               
`pod install LMJVerticalScrollText`
* 手动导入:             
    * 将 `LMJVerticalScrollText` 文件拖拽到工程中
    * 导入头文件`#import "LMJVerticalScrollText.h"`
    
## 更新日志
- **2019.5.22（3.0.0）：**            
全新的3.0版本来啦！                 
为更贴合控件功能，项目名称将由LMJScrollTextView2更换为LMJVerticalScrollText                     
本次更新增加了大家一直要求的cocoapods安装，并完善了demo模块的文件结构以及全新的中英文文档                   
- **2018.5.29（2.2.2）：**                 
本次更新修复了在xib或storyboard中使用时出现了多个字条的显示错误；                   
优化Demo演示效果，并添加了在storyboard中使用本控件的演示。                      
- **2018.5.16（2.2.0）：**                                   
本次更新支持了文字停留、滚动时间的设置以及修复bug：                  
（1）支持设置文字停留的时间，默认为3s                   
（2）支持设置文字动画单次滚动时间，默认为1s                       
（3）修复文字滚动时点击无法响应                 
- **2018.1.3（2.1.0）：**                    
本次更新在数据源textDataArr中支持了NSAttributedString类型数据，使能够显示的文字类型更加丰富。                  
- **2017.12.28（2.0.0）：**                                    
本次更新在原有的基础上增加更多滚动方式、属性设置以及回调方法：                  
（1）由原来的有间隙滚动，增加到有间隙和无间隙两种滚动方式。方法分别是startScrollBottomToTopWithSpace、startScrollTopToBottomWithSpace、startScrollBottomToTopWithNoSpace、startScrollTopToBottomWithNoSpace                      
（2）增加了文字的对齐方式和是否可以响应点击设置                  
（3）增加了点击回调代理函数                     
- **2017.8.18（1.3.5）：**                                   
修复了反复调用startScrollBottomToTop / startScrollTopToBottom方法会产生异常效果的问题。                 
- **2017.8.16（1.3.2）：**                                           
在demo中添加了把控件添加到cell上的测试。             
- **2017.7.29（1.3.1）：**                                                       
修复app进入后台后，循环速度剧增、消耗大量cpu的的问题。             
- **2017.2.14（1.3.0）：**                         
修复进入其他页面后，循环速度剧增、消耗大量cpu的的问题。              
- **2017.2.13（1.2.0）：**                                
添加了一个简单的代理回调，用于返回当前信息的序号。               
- **2017.2.13（1.1.0）：**                          
有朋友说第一条数据走了两次，后来查找一下原因发现是定时器的问题。                     
修改后取消使用定时器，改用循环调用实现。                


      

                    
               
