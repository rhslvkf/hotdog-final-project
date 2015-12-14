package com.jsonobject.minichat.dao;

import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sql2o.Connection;
import com.jsonobject.minichat.model.Message;

public class MessageDAOImpl implements MessageDAO {

    private static final Logger logger = LoggerFactory.getLogger(MessageDAOImpl.class);

    private Connection connection;

    public MessageDAOImpl(Connection connection) {
        super();
        this.connection = connection;
    }

    @Override
    public Long getLastMessageId() {
        logger.info("===== getLastMessageId(): start");
        if (this.connection == null) {
            return null;
        }
        Long lastMessageId = connection.createQuery("SELECT MAX(\"MessageId\") FROM \"Message\"").executeAndFetchFirst(
                Long.class);
        if (lastMessageId == null) {
            lastMessageId = 0L;
        }
        logger.info("===== getLastMessageId(): end, lastMessageId={}", lastMessageId.toString());

        return lastMessageId;
    }

    @Override
    public void create(Message message) {
        logger.info("===== create(): start, message={}", message.toString());
        if (this.connection == null) {
            return;
        }
        connection.createQuery("INSERT INTO \"Message\" (\"UserName\", \"Message\", \"DateCreated\") VALUES (:userName, :message, NOW())")
                .addParameter("userName", message.getUserName()).addParameter("message", message.getMessage()).executeUpdate();
        logger.info("===== create(): end");
    }

    @Override
    public List<Message> readById(Long messageId) {
        logger.info("===== readById(): start, messageId={}", messageId);
        List<Message> messageList = new ArrayList<Message>();
        if (this.connection == null) {
            return messageList;
        }
        messageList = connection
                .createQuery(
                        "SELECT \"MessageId\", \"UserName\", \"Message\", \"DateCreated\" FROM \"Message\" WHERE \"MessageId\" > :messageId ORDER BY \"MessageId\" ASC")
                .addParameter("messageId", messageId).executeAndFetch(Message.class);
        logger.info("===== readById(); end, messageList={}", messageList.toString());

        return messageList;
    }
}
