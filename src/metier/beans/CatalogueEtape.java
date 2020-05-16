package metier.beans;

import persistence.entities.CatalogueEtapeEntity;

public class CatalogueEtape {
    private CatalogueEtapeEntity catalogueEtapeEntity;

    public CatalogueEtape(CatalogueEtapeEntity catalogueEtapeEntity) {
        this.catalogueEtapeEntity = catalogueEtapeEntity;
    }


    public CatalogueEtapeEntity getCatalogueEtapeEntity() {
        return catalogueEtapeEntity;
    }

    public void setCatalogueEtapeEntity(CatalogueEtapeEntity catalogueEtapeEntity) {
        this.catalogueEtapeEntity = catalogueEtapeEntity;
    }

    public String getLibelle() {
        return this.catalogueEtapeEntity.getLibelle();
    }


}
