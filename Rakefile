# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'PaperPan'
  app.files = [Dir.glob('./app/*.rb'),
               Dir.glob('./lib/*.rb')].flatten

  app.info_plist['UIViewControllerBasedStatusBarAppearance'] = false
end
