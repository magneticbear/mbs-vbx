require "sinatra"
require "sinatra/twilio"

xJP = "101"
xBrandon = "102"
xMohammad = "103"
xStuart = "104"
xWendy = "105"
xAdrian = "106"
XAstley = "333"

respond "/voice" do
  gather = Twilio::Gather.new(:action => "/extension", :numDigits => "3")
  # gather.addSay "Welcome to Magnetic Bear Studios. Please enter 101 for JP, 102 for Brandon, 103 for Mo, 104 for Stuart, 105 for Wendy or 106 for Adrian."
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
  when xBrandon
    # addSay "Please wait while we connect you to Brandon"
    addPlay "/Brandon.mp3"
    addDial ENV['BRANDON_PHONE']
  when xMohammad
    # addSay "Please wait while we connect you to Mo"
    addPlay "/Mo.mp3"
    addDial ENV['MOHAMMAD_PHONE']
  when xStuart
    # addSay "Please wait while we connect you to Stuart"
    addPlay "/Stuart.mp3"
    addDial ENV['STUART_PHONE']
  when xWendy
    # addSay "Please wait while we connect you to Wendy"
    addPlay "/Wendy.mp3"
    addDial ENV['WENDY_PHONE']
  when xAdrian
    # addSay "Please wait while we connect you to Adrian"
    addPlay "/Adrian.mp3"
    addDial ENV['ADRIAN_PHONE']
  when XAstley
    addPlay "/Astley.mp3"
  else
    # addSay "The extension you entered is not valid. Please try again."
    addPlay "/Error.mp3"
    addRedirect "/voice"
  end
end