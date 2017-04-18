package org.agent.interceptor;

import java.util.Map;

import org.agent.common.Constants;
import org.agent.pojo.User;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class SysInterceptor implements Interceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4062947294130499713L;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		// TODO Auto-generated method stub
		Map session = ai.getInvocationContext().getSession();
        User user = (User) session.get(Constants.SESSION_USER);
         if ( null != user && null != user.getUserCode() && null != user.getUserPassword()
        		 && !"".equals(user.getUserCode()) && !"".equals(user.getUserPassword())
        		 && user.getIsStart() == 1
        		 )  {
             return ai.invoke();
        } else  {
             return Action.LOGIN;
        }
	}

}
