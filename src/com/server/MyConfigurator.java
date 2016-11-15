package com.server;

import javax.websocket.server.ServerEndpointConfig.Configurator;

public class MyConfigurator extends Configurator {
	 private WsServlet webSocket = new WsServlet();
	   
	   
	   
	    @Override
	    public <T> T getEndpointInstance(Class<T> clazz) throws InstantiationException {
	        return (T) webSocket;
	    }
}
