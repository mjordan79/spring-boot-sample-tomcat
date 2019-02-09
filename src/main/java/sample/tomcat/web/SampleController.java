package sample.tomcat.web;

import sample.tomcat.service.HelloWorldService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SampleController {

	@Autowired
	private HelloWorldService helloWorldService;
	
	@GetMapping("/")
	@ResponseBody
	public String getIPAddresss() {
	    return "Application running on pod: " + this.helloWorldService.getHostname();
	}
	
	@GetMapping("/hello")
	@ResponseBody
	public String helloWorld() {
		return this.helloWorldService.getHelloMessage();
	}

}
