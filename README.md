# NestedStackViews
AutoLayout Nested Stack View

</br>
<a href="https://imgur.com/cp6lSyu"><img src="https://i.imgur.com/cp6lSyu.png" title="source: imgur.com" /></a>
</br>
<a href="https://imgur.com/UBSifDu"><img src="https://i.imgur.com/UBSifDu.png" title="source: imgur.com" /></a>

Istructions:
-------------
    1. Root Stack View.Leading = Superview.LeadingMargin => Right Click + Drag and Drop StackView to the SuperView + PopUp Window will appear, then select Leading Related Options

    2. Root Stack View.Trailing = Superview.TrailingMargin
    
    2. Root Stack View.Top = Top Layout Guide.Bottom + 20.0 => If you dont find Top Layout Guide select iphone 7 from storyboard
    
    3. Bottom Layout Guide.Top = Root Stack View.Bottom + 20.0
    
    4. Image View.Height = Image View.Width
    
    5. First Name Text Field.Width = Middle Name Text Field.Width => Right Click + Drag and Drop First Name Text Field to the Middle Name Text Field + PopUp Window will appear, then select Equal Width / Width Related Options
    
    6. First Name Text Field.Width = Last Name Text Field.Width


References:
-----------
https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/LayoutUsingStackViews.html#//apple_ref/doc/uid/TP40010853-CH11-SW1
