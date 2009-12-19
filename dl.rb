require 'httpclient'

clnt = HTTPClient.new
content =  clnt.get_content 'http://cyrusinnovation.com/images/home_logo.jpg'

file_out = File.new "test.jpg", "wb"
file_out.write content
file_out.close
