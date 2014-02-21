class UIView
  def outline(color=nil)
    layer.borderWidth = 1
    layer.borderColor = (color && color.CGColor) || UIColor.greenColor.CGColor
  end
end
