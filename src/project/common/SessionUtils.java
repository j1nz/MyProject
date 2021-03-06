package project.common;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import project.model.enumClass.Active;
import project.model.enumClass.Role;

public class SessionUtils {
	private static SessionUtils instance = null;
	
	public static SessionUtils getInstance() {
		if (instance == null)
			instance = new SessionUtils();
		
		return instance;
	}
	
	public String checkSessionEmpty() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		if (session.size() == 0) {
			return Contants.SES_NOT_EXIST_SESSION;
		} else {
			return Contants.SES_EXIST_SESSION;
		}
	}
	
	public String getUsernameSession() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		return session.get(Contants.KEY_MAP_SESSION_USERNAME).toString();
	}
	
	public String getAccountIdSession() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		return session.get(Contants.KEY_MAP_SESSION_ACCOUNT_ID).toString();
	}
	
	public String checkSessionType() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		if (session.get(Contants.KEY_MAP_SESSION_ROLE).toString().equals(Role.ADMIN.value())) {
			return Contants.SES_IS_ADMIN_SESSION;
		}
		if (session.get(Contants.KEY_MAP_SESSION_ROLE).toString().equals(Role.MODIFIER.value())) {
			return Contants.SES_IS_MODIFIER_SESSION;
		}
		if (session.get(Contants.KEY_MAP_SESSION_ROLE).toString().equals(Role.NORMAL.value())) {
			return Contants.SES_IS_NORMAL_SESSION;
		}
		if (session.get(Contants.KEY_MAP_SESSION_ROLE).toString().equals(Role.GUEST.value())) {
			return Contants.SES_IS_GUEST_SESSION;
		} else {
			return Contants.SES_IS_UNKNOWN_SESSION;
		} 
	}
	
	public boolean checkIsActive() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		
		int active = Integer.valueOf(session.get(Contants.KEY_MAP_SESSION_IS_ACTIVE).toString());
		
		if (active == Active.ACTIVE.value()) {
			return true;
		} else {
			return false;
		}
	}
}
