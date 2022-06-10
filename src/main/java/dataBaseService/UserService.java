package dataBaseService;

import model.User;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserService {
/*    private Dao_users dao_users = new Dao_users();
    private List<User> listUser = null;*/


    public UserService() {
    }

    public boolean userIsExist(String login, String password, List<User> listUser) {

        boolean result = false;

        for (User user : listUser) {
            if (user.getLogin().equals(login) && user.getPassword().equals(password)) {

                result = true;
                break;
            }
        }
        return result;
    }


    public User.ROLE getRoleByLoginPassword(String login, String password, List<User> listUser) {
        User.ROLE result = User.ROLE.UNKNOWN;

        for (User user : listUser) {
            if (user.getLogin().equals(login) && user.getPassword().equals(password)) {
                result = user.getRole();
            }
        }

        return result;
    }


}
