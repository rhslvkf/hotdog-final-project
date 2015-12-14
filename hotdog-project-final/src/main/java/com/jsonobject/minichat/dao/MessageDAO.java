package com.jsonobject.minichat.dao;

import java.util.List;
import com.jsonobject.minichat.model.Message;

public interface MessageDAO {
    public Long getLastMessageId();

    public void create(Message message);

    public List<Message> readById(Long messageId);
}
