require "sinatra"
require "sinatra/twilio"

xJP = "101"
xRobyn = "102"
xMohammad = "103"
xStuart = "104"

respond "/voice" do
  gather = Twilio::Gather.new(:action => "/extension", :numDigits => "3")
  # gather.addSay "Welcome to Magnetic Bear Studios. Please enter 101 for JP, 102 for Robyn, 103 for Mohammad or 104 for Stuart."
  gather.addPlay "/Welcome.mp3"
  append gather
  addRedirect "/voice"
end

respond "/extension" do
  case params[:Digits]
  when xJP
    # addSay "Please wait while we connect you to JP"
    addPlay "/JP.mp3"
    addDial ENV['JP_PHONE']
  when xRobyn
    # addSay "Please wait while we connect you to Robyn"
    addPlay "/Robyn.mp3"
    addDial ENV['ROBYN_PHONE']
  when xMohammad
    # addSay "Please wait while we connect you to Mohammad"
    addPlay "/Mohammad.mp3"
    addDial ENV['MOHAMMAD_PHONE']
  when xStuart
    # addSay "Please wait while we connect you to Stuart"
    addPlay "/Stuart.mp3"
    addDial ENV['STUART_PHONE']
  else
    addSay "The extension you entered is not valid. Please try again."
    addRedirect "/voice"
  end
end