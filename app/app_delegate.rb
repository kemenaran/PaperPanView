class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible
    @window.rootViewController = PaperViewController.new

    application.setStatusBarStyle(UIStatusBarStyleLightContent)
    true
  end
end
