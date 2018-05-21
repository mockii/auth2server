package com.mockii.authserver.service;


import com.mockii.authserver.resource.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.util.List;


/**
 *
 */
@Service
public class AccountUserDetailsService implements UserDetailsService {

    @Qualifier("appDataSource")
    @Autowired
    private DataSource appDataSource;

    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        Account account = getAccount(userName);
        User user = new User(account.getUserName(), account.getPassword(), AuthorityUtils.createAuthorityList("ROLE_USER"));
        return user;
    }

    private Account getAccount(String userName) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(appDataSource);
        String query = "SELECT * FROM auth_mockii.USERS WHERE USER_NAME = ?";
        Object objects[] = {userName};
        List<Account> list = jdbcTemplate.query(query, objects,
                (rs, arg1) -> {
                    Account entity = new Account();
                    entity.setUserName(rs.getString("USER_NAME"));
                    entity.setPassword(rs.getString("PASSWORD"));
                    return entity;
                });
        if (!list.isEmpty()) {
            return list.get(0);
        }
        return null;
    }
}
