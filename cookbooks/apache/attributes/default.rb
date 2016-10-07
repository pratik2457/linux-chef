default["apache"]["sites"]["pratik24572"] = { "sitehead" => "Wesite comming soon centos","port" => 80, "domain" => "pratik24572.mylabserver.com" }
default["apache"]["sites"]["pratik24572b"] = { "sitehead" => "Websitecomingsoon centos","port" => 80, "domain" => "pratik24572b.mylabserver.com" } 

default["apache"]["sites"]["pratik24573"] = { "sitehead" => "website 3 ubuntu comming soon", "port" => 80, "domain" => "pratik24573.mylabserver.com"}

case node["platform"]
when "centos"
	default["apache"]["package"] = "httpd"
when "ubuntu"
	default["apache"]["package"] = "apache2"
end 
