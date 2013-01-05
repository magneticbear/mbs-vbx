require "sinatra"
require "sinatra/twilio"

xJP = "101"
xRobyn = "102"
xMohammad = "103"
xStuart = "104"
xAlex = "105"
xAdrian = "106"
xNeil = "107"
xWendy = "108"
xBrandon = "109"

respond "/voice" do
  gather = Twilio::Gather.new(:action => "/extension", :numDigits => "3")
  gather.addSay "Welcome to Magnetic Bear Studios. Please enter 101 for JP, 103 for Mohammad, 104 for Stuart, 106 for Adrian, 108 for Wendy or 109 for Brandon."
  append gather
  addRedirect "/voice"
end

respond "/extension" do
  case params[:Digits]
  when xJP
    addSay "Please wait while we connect you to JP"
    addDial ENV['JP_PHONE']
  when xMohammad
    addSay "Please wait while we connect you to Mohammad"
    addDial ENV['MOHAMMAD_PHONE']
  when xStuart
    addSay "Please wait while we connect you to Stuart"
    addDial ENV['STUART_PHONE']
  when xAdrian
    addSay "Please wait while we connect you to Adrian"
    addDial ENV['ADRIAN_PHONE']
  when xWendy
    addSay "Please wait while we connect you to Wendy"
    addDial ENV['WENDY_PHONE']
  when xBrandon
    addSay "Please wait while we connect you to Brandon"
    addDial ENV['BRANDON_PHONE']
  else
    addSay "The extension you entered is not valid. Please try again."
    addRedirect "/voice"
  end
end