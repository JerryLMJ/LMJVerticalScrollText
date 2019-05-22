[简体中文](./README.md) | English

![(logo)](https://avatars2.githubusercontent.com/u/15794032?s=460&v=4)

# LMJVerticalScrollText

![podversion](https://img.shields.io/cocoapods/v/LMJVerticalScrollText.svg?style=flat)
![](https://img.shields.io/cocoapods/p/LMJVerticalScrollText.svg?style=flat)
![](https://img.shields.io/badge/language-oc-orange.svg)
![](https://img.shields.io/cocoapods/l/LMJVerticalScrollText.svg?style=flat)

- A simple and easy to use string scroll control

## Support what kinds of scenarios to use
- UIView、UITableViewCell、Storyboard etc.


## Usage
 * use cocoa pod:
`pod install LMJVerticalScrollText`

* Manual import:
    * Drag All files in the `LMJVerticalScrollText` folder to project
    * Import the main file：`#import "LMJVerticalScrollText.h"`


## Update log
- **2019.5.22（3.0.0）：**               
The new 3.0 version is here!                                
To better fit the control functionality, the project name will be changed from LMJScrollTextView2 to LMJVerticalScrollText                  
This update adds the installation of cocoapods that you have been asking for, and improves the file structure of demo module as well as new Chinese and English documents                      
- **2018.5.29（2.2.2）：**                       
This update fixes the display error of multiple notes when used in xib or storyboard.                     
Optimize Demo Demo effect, and added the use of this control in the storyboard Demo.                                          
- **2018.5.16（2.2.0）：**                        
This update supports Settings for text retention, scrolling time, and bug fixes:                          
(1) support setting the duration of text retention, which is 3s by default                       
(2) support setting the single scrolling time of text animation, which is 1s by default                
(3) fix text scrolling when clicking can not respond                                       
- **2018.1.3（2.1.0）：**                 
This update supports NSAttributedString type data in textDataArr data source, which enriches the text types that can be displayed.                                       
- **2017.12.28（2.0.0）：**                                      
This update adds more scrolling modes, property Settings and callback methods to the existing ones:                     
(1) from the original rolling mode with clearance to two rolling modes with clearance and without clearance. Methods are respectively startScrollBottomToTopWithSpace, startScrollTopToBottomWithSpace, startScrollBottomToTopWithNoSpace, startScrollTopToBottomWithNoSpace                     
(2) added the text alignment and whether it can respond to the click setting                
(3) click callback proxy function is added                     
- **2017.8.18（1.3.5）：**                                    
Fixed the issue where bottomtotop/startScrollTopToBottom methods should again be called with abnormal results.                                       
- **2017.8.16（1.3.2）：**                                            
Added tests to add controls to the cell in the demo.                        
- **2017.7.29（1.3.1）：**                                                        
Fixed the problem of dramatically increasing cycle speed and consuming a large amount of CPU after the app entered the background.                              
- **2017.2.14（1.3.0）：**                          
Fixed an issue where the loop speed increased dramatically and consumed a large amount of CPU after entering other pages.        
- **2017.2.13（1.2.0）：**                                 
A simple proxy callback has been added to return the sequence number of the current information.                        
- **2017.2.13（1.1.0）：**                           
A friend said that the first data went twice, and later found out the reason is the timer problem.                   
Cancel the use of timer after modification, use circular call implementation.                           


      

                    
               
