package metier.beans;


import persistence.entities.PersonnelEntity;

import javax.swing.*;

abstract public class User {
    private PersonnelEntity user;

    public User() {
    }

    public User(PersonnelEntity user) {
        this.user = user;
    }

    public PersonnelEntity getUser() {
        return user;
    }

    public void setUser(PersonnelEntity user) {
        this.user = user;
    }

    public JComboBox<String> getFullName() {
        String fulName = String.format("%s %s", user.getNom(), user.getPrenom());
        JComboBox<String> box = new JComboBox<>();
        box.addItem(fulName);
        return box;
    }
}
