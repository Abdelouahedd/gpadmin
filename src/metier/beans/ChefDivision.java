package metier.beans;

import persistence.entities.PersonnelEntity;

import java.util.List;

public class ChefDivision extends Employee {
    private List<Demande> demandes;


    public ChefDivision(PersonnelEntity entity) {
        super(entity);
    }

    public List<Demande> getDemandes() {
        return demandes;
    }

    public void setDemandes(List<Demande> demandes) {
        this.demandes = demandes;
    }
}
