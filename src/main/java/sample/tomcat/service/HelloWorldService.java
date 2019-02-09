package sample.tomcat.service;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class HelloWorldService {

	@Value("${name:World}")
	private String name;

	public String getHelloMessage() {
		return "Hello " + this.name;
	}

	public String getHostname() {
		try {
			return InetAddress.getLocalHost().getHostName();
		} catch(UnknownHostException ex) {
			return "Cannot determine hostname";
		}
	}
	
}
