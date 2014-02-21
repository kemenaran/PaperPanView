class PaperPanView < UIView
  def initWithFrame(frame)
    super

    self.backgroundColor = UIColor.blackColor

    @background = BackgroundView.alloc.initWithFrame(bounds)
    @background.set_image(UIImage.imageNamed('Background'))
    @background.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight
    addSubview(@background)

    scrollview = UIScrollView.alloc.initWithFrame(bounds)
    scrollview.delegate = self
    scrollview.contentSize = [2000, scrollview.frame.size.height * 1.5]
    scrollview.maximumZoomScale = 2.0
    scrollview.showsVerticalScrollIndicator = false
    scrollview.decelerationRate = UIScrollViewDecelerationRateFast
    addSubview(scrollview)

    @panel = UIView.alloc.initWithFrame([[0, scrollview.frame.size.height / 2],
                                         [scrollview.contentSize.width, scrollview.frame.size.height / 2]])
    scrollview.addSubview(@panel)

    pages_ratio = bounds.size.width / bounds.size.height
    page_size = [@panel.bounds.size.height * pages_ratio,
                 @panel.bounds.size.height]
    13.times do |i|
      frame = [[i * (page_size[0] + 5), 0],
               page_size]
      page = PaperPageView.alloc.initWithFrame(frame)
      @panel.addSubview(page)
    end

    self
  end

  def scale_background(scaled)
    bg_transform = (scaled && CGAffineTransformMakeScale(0.98, 0.99)) || CGAffineTransformIdentity
    UIView.animateWithDuration(0.4, animations: -> {
      @background.transform = bg_transform
    })
  end

  def scrollViewWillBeginDragging(scrollview)
    location_in_panel = scrollview.panGestureRecognizer.locationInView @panel

    panel_frame = @panel.frame
    @panel.layer.anchorPoint = [location_in_panel.x / @panel.bounds.size.width,
                                0]
    @panel.frame = panel_frame

    scale_background(true)
  end

  def scrollViewDidScroll(scrollview)
    scale = scrollview.contentOffset.y / (scrollview.frame.size.height / 2.0) + 1.0
    @panel.transform = CGAffineTransformMakeScale(scale, scale)
  end

  def scrollViewWillEndDragging(scrollview, withVelocity:v, targetContentOffset:target_ptr)
    position = scrollview.contentOffset.y
    target = target_ptr.value
    @zoomed = position > scrollview.frame.size.height / 4
    if @zoomed
      target.y = scrollview.frame.size.height / 2
    else
      target.y = 0
    end
    target_ptr.assign target
  end

  def scrollViewDidEndDragging(scrollview, willDecelerate: decelerate)
    scale_background(@zoomed)
  end
end
