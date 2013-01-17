require "sinatra"
require "sinatra/twilio"

xJP = "101"
xBrandon = "102"
xMohammad = "103"
xStuart = "104"
xWendy = "105"
xAdrian = "106"

respond "/voice" do
  gather = Twilio::Gather.new(:action => "/extension", :numDigits => "3")
  gather.addSay "Welcome to Magnetic Bear Studios. Please enter 101 for JP, 102 for Brandon, 103 for Mo, 104 for Stuart, 105 for Wendy or 106 for Adrian."
  append gather
  addRedirect "/voice"
end

respond "/extension" do
  case params[:Digits]
  when xJP
    addSay "Please wait while we connect you to JP"
    addDial ENV['JP_PHONE']
  when xBrandon
    addSay "Please wait while we connect you to Brandon"
    addDial ENV['BRANDON_PHONE']
  when xMohammad
    addSay "Please wait while we connect you to Mo"
    addDial ENV['MOHAMMAD_PHONE']
  when xStuart
    addSay "Please wait while we connect you to Stuart"
    addDial ENV['STUART_PHONE']
  when xWendy
    addSay "Please wait while we connect you to Wendy"
    addDial ENV['WENDY_PHONE']
  when xAdrian
    addSay "Please wait while we connect you to Adrian"
    addDial ENV['ADRIAN_PHONE']
  else
    addSay "The extension you entered is not valid. Please try again."
    addRedirect "/voice"
  end
end