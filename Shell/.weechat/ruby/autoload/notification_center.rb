# See installation instructions at
# https://github.com/wallace/weechat-notification-center-rb
# Derived from https://github.com/tinifni/gntp-notify
require 'rubygems'
require 'weechat'
require 'terminal-notifier'
include Weechat

def weechat_init
  Weechat.register("notification_center_rb",
                   "Jonathan Wallace",
                   "0.0.1",
                   "GPL3",
                   "Ruby Notification Center",
                   "0.0.5",
                   "Pass highlights and private messages to the OS X 10.8+ Notification Center")

  hook_notifications

  return Weechat::WEECHAT_RC_OK
end

def hook_notifications
  #Weechat.hook_signal("*", "show_all", "")
  Weechat.hook_signal("weechat_pv", "show_private", "")
  Weechat.hook_signal("weechat_highlight", "show_highlight", "")
end

def unhook_notifications(data, signal, message)
  Weechat.unhook(show_private)
  Weechat.unhook(show_highlight)
end

def show_all(data, signal, message)
  show_notification("Weechat Event",  message)
  return Weechat::WEECHAT_RC_OK
end

def show_private(data, signal, message)
  show_notification("Weechat Private Message",  message)
  return Weechat::WEECHAT_RC_OK
end

def show_highlight(data, signal, message)
  show_notification("Weechat",  message)
  return Weechat::WEECHAT_RC_OK
end

def show_notification(title, message)
  TerminalNotifier.notify(message, { :title  => title })
end
