package com.jsonobject.minichat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sql2o.Connection;
import org.sql2o.Sql2o;
import com.google.gson.Gson;
import com.jsonobject.minichat.config.ApplicationConfig;
import com.jsonobject.minichat.dao.MessageDAO;
import com.jsonobject.minichat.dao.MessageDAOImpl;
import com.jsonobject.minichat.model.Message;

@WebServlet(urlPatterns = { "/message/*" }, asyncSupported = true)
public class MessageController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final Logger logger = LoggerFactory.getLogger(MessageController.class);

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            logger.info("===== doGet(): start");
            String action = request.getParameter("action");
            Method actionMethod = this.getClass().getDeclaredMethod(action, HttpServletRequest.class, HttpServletResponse.class);
            actionMethod.invoke(this, request, response);
            logger.info("===== doGet(): end");
        } catch (Exception e) {
            logger.error("===== doGet(): excepton={}", ExceptionUtils.getRootCause(e));
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            logger.info("===== doPost(): start");
            Map<String, Object> param = new Gson().fromJson(request.getReader().readLine(), Map.class);
            String action = param.get("action").toString();
            Method actionMethod = this.getClass().getDeclaredMethod(action, Map.class, HttpServletRequest.class, HttpServletResponse.class);
            actionMethod.invoke(this, param, request, response);
            logger.info("===== doPost(): end");
        } catch (Exception e) {
            logger.error("===== doPost(): excepton={}", ExceptionUtils.getRootCause(e));
        }
    }

    @SuppressWarnings({ "unused" })
    private void getNewMessages(HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        logger.info("===== readNewMessages(): start");
        Connection db = new Sql2o(ApplicationConfig.getDataSource(getServletContext())).open();
        MessageDAO messageDAO = new MessageDAOImpl(db);
        Long lastMessageId = messageDAO.getLastMessageId();
        db.close();
        while (true) {
            db = new Sql2o(ApplicationConfig.getDataSource(getServletContext())).open();
            messageDAO = new MessageDAOImpl(db);
            List<Message> newMessageList = messageDAO.readById(lastMessageId);
            db.close();
            if (newMessageList.size() > 0) {
                lastMessageId = newMessageList.get(newMessageList.size() - 1).getMessageId();
                response.setContentType("text/event-stream;charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
                PrintWriter writer = response.getWriter();
                writer.write("event: message\n\n");
                writer.write("data: " + new Gson().toJson(newMessageList) + "\n\n");
                writer.flush();
                logger.info("===== readNewMessages(): send new messages to client, message={}", newMessageList.toString());
            }
            Thread.sleep(100);
        }
    }

    @SuppressWarnings({ "unused", "unchecked" })
    private void create(Map<String, Object> param, HttpServletRequest request, HttpServletResponse response) {
        logger.info("===== create(): start, param={}", param.toString());
        Message message = new Message();
        message.setUserName(((Map<String, Object>) param.get("data")).get("userName").toString());
        message.setMessage(((Map<String, Object>) param.get("data")).get("message").toString());
        Connection con = new Sql2o(ApplicationConfig.getDataSource(getServletContext())).beginTransaction();
        MessageDAO messageDAO = new MessageDAOImpl(con);
        messageDAO.create(message);
        con.commit();
        logger.info("===== create(): end");
    }
}
