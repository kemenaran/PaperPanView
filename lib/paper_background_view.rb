

class BackgroundView < UIView
  def initWithFrame(frame)
    super

    contentMode = UIViewContentModeRedraw
    layer.masksToBounds = true
    layer.cornerRadius = 10

    @top = UIImageView.new
    @top.layer.anchorPoint = [0, 0]
    addSubview(@top)

    @bottom = UIImageView.new
    @bottom.layer.anchorPoint = [0, 1]
    @bottom.transform = CGAffineTransformMakeScale(1, -1)
    addSubview(@bottom)

    self
  end

  def set_image(image)
    @top.image = image
    @bottom.image = image
  end

  def layoutSubviews
    half_bounds = [[0, 0], [bounds.size.width, bounds.size.height / 2]]

    @top.bounds = half_bounds
    @top.center = [0, 0]

    @bottom.bounds = half_bounds
    @bottom.center = [0, bounds.size.height / 2]
  end
end