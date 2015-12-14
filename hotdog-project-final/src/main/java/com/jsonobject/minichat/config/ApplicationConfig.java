package com.jsonobject.minichat.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@WebListener
public class ApplicationConfig implements ServletContextListener {

    private static final Logger logger = LoggerFactory.getLogger(ApplicationConfig.class);

    private enum ApplicationMode {
        TEST, PRODUCTION,
    }

    private static final ApplicationMode APPLICATION_MODE = ApplicationMode.TEST;

    public static DataSource getDataSource(ServletContext sce) {
        DataSource dataSource = (DataSource) sce.getAttribute("dataSource");
        return dataSource;
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        logger.info("===== contextInitialized() start");
        HikariConfig config = new HikariConfig();
        if (APPLICATION_MODE == ApplicationMode.TEST) {
            config.setDataSourceClassName("org.h2.jdbcx.JdbcDataSource");
            config.setConnectionTestQuery("SELECT NOW()");
            config.setConnectionInitSql("CREATE TABLE IF NOT EXISTS \"Message\" (\"MessageId\" INT(11) NOT NULL AUTO_INCREMENT, \"UserName\" VARCHAR(255) NOT NULL, \"Message\" VARCHAR(1024) NOT NULL, \"DateCreated\" DATETIME NOT NULL, PRIMARY KEY(\"MessageId\")) AUTO_INCREMENT = 1");
            config.addDataSourceProperty("URL", "jdbc:h2:mem:minichat;MODE=MySQL");
            config.addDataSourceProperty("user", "minichatUser");
            config.addDataSourceProperty("password", "minichatPassword");
        }
        HikariDataSource dataSource = new HikariDataSource(config);
        sce.getServletContext().setAttribute("dataSource", dataSource);
        logger.info("===== contextInitialized() end");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }

}
