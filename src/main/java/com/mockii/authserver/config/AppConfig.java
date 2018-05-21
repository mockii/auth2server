package com.mockii.authserver.config;

import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

/**
 *
 */
@Configuration
public class AppConfig {
	
	
    
   /* @Value("${spring.datasource.url}")
    private String datasourceUrl;
    
    @Value("${spring.database.driverClassName}")
    private String dbDriverClassName;
    
    @Value("${spring.datasource.username}")
    private String dbUsername;
    
    @Value("${spring.datasource.password}")
    private String dbPassword;
    
    @Bean
    public DataSource dataSource() {
        final DriverManagerDataSource dataSource = new DriverManagerDataSource();
        
        dataSource.setDriverClassName(dbDriverClassName);
        dataSource.setUrl(datasourceUrl);
        dataSource.setUsername(dbUsername);
        dataSource.setPassword(dbPassword);
        
        return dataSource;
    }*/

    @Bean(name = "authDataSource")
    @Primary
    @ConfigurationProperties(prefix = "auth.datasource")
    public DataSource authDataSource() {
        DataSource ds = DataSourceBuilder
                .create()
                .build();
        return ds;
    }

    /*@Bean(name = "appDataSource")
    @ConfigurationProperties(prefix = "app.datasource")
    public DataSource dataSource() {
        DataSource ds = DataSourceBuilder
                .create()
                .build();
        return ds;
    }*/

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
  /*  @Bean
    public TokenStore tokenStore() {
        return new JdbcTokenStore(authDataSource);
    }*/
}
