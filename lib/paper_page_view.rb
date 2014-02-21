class PaperPageView < UIView
  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.lightGrayColor
    layer.shadowOpacity = 0.6
    layer.shadowOffset = [0, 0]
    layer.shadowPath = shadow_path

    self
  end

  def setFrame(frame)
    super
    layer.shadowPath = shadow_path
  end

  def shadow_path
    UIBezierPath.bezierPathWithRect(bounds).CGPath
  end
end