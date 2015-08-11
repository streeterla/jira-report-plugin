<%@ page import="com.atlassian.jira.ManagerFactory,
                 java.lang.reflect.Method,
                 com.atlassian.mail.queue.MailQueueImpl"%>
<%
    MailQueueImpl mailQueue = (MailQueueImpl) ManagerFactory.getMailQueue();
    Class[] params= new Class[]{};
    try
    {
        Method endMethod = MailQueueImpl.class.getDeclaredMethod("sendingStopped", params);
        endMethod.setAccessible(true);
        endMethod.invoke(mailQueue,params);
        endMethod.setAccessible(false);
    }
    catch (Exception e)
    {
        out.print(e);
    }
%>
