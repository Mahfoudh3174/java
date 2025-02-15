package com.data;

import java.util.HashMap;
import java.util.Map;

import com.model.User;

public class UserDB {
    private static Map<String, User> users = new HashMap<>();

    static {
        // Default Admin User
        User admin = new User("admin", "admin", "admin");
        admin.setNumero("1");
        users.put(admin.getNumero(), admin);
    }

    public static void addUser(User user) {
        
        users.put(user.getNumero(), user);
          
    }

    public static Map<String, User> getUsers() {
        return users;
    }

    public static Map<String, User> getBib() {
        Map<String, User> bibs = new HashMap<>();
        for (User u : users.values()) {
            if ("bibliothecaire".equals(u.getRole())) {
                bibs.put(u.getNumero(), u);
            }
        }
        return bibs;
    }

    public static User findUser(String nom, String password) {
        return users.values().stream()
                .filter(user -> user.getNom().equals(nom) && user.getPassword().equals(password))
                .findFirst()
                .orElse(null);
    }



    public static void deleteUser(String id) {
        users.remove(id);
    }

    public static User findUserById(String id) {
        return users.get(id);
    }

    public static boolean isUser(String id) {
        return users.containsKey(id);
    }

    public static void editPass(String password) {
        User admin = users.values().stream()
                .filter(user -> "admin".equals(user.getRole()))
                .findFirst()
                .orElse(null);
        if (admin != null) {
            admin.setPassword(password);
        }
    }

    public static void editUser(User user) {
        users.put(user.getNumero(), user);
    }
}
