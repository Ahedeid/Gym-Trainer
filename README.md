
## Design

 
# Gym Trainer


# APK
<p align="center">
<a href="https://drive.google.com/file/d/1xl7bkY9usKwP4Yg2Z31stLjcxOEkE6yD/view?usp=sharing" target="_blank"><img src="screenShots/download.png" width="300"></a>
 </p>

Folder Structure 
By Feature inside every features will be MVC.



```
 |-lib|
     |     
     | Registration | models -> All models that conceren with this feature 
                    | screens -> If the feature has many sub features you can divide it with sub folder if needed
                    | providers -> All providers that needed in this feature 
                    | repositories -> For every provider should have his repo
                    | widgets -> Just the widget that concern with this feature 
```

## Usage
If you wanna access resources manger:


```dart
# colors
ColorManager.primary;

# images
ImageAssets.splashLogoPng;
SVGAssets.homeSvg;
IconAssets.arrowRight;

# fontWeightManager
FontWeightManager.black;

# text Strings
AppString.bankWithdraw;
```



# For navigation the project built based on OnGenerateRoute:


```dart
# pushNamed
sl<NavigationService>().navigateTo(Routes.home);

# pushNamedAndRemoveUntil
sl<NavigationService>().navigateToAndRemove(Routes.home);

# pop;
sl<NavigationService>().pop();
```
