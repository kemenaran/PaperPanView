class PaperViewController < UIViewController
  def viewDidLoad
    @pan_view = PaperPanView.alloc.initWithFrame(view.bounds)
    @pan_view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight
    view.addSubview(@pan_view)
  end
end
