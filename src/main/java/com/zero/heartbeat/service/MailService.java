package com.zero.heartbeat.service;

public interface MailService {

	boolean send(String subject, String string, String string2, String email, Object object);

}
