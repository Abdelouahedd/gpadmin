package metier.gestionnaire;

import metier.beans.CatalogueEtape;
import persistence.DAOCatalogueEtape;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class GestionnaireCatEtap {
    private DAOCatalogueEtape daoCatalogueEtape;

    public GestionnaireCatEtap() {
        this.daoCatalogueEtape = new DAOCatalogueEtape();
    }

    public Integer save(CatalogueEtape obj) {
        return daoCatalogueEtape.save(obj.getCatalogueEtapeEntity());
    }

    public CatalogueEtape getById(Integer id) {
        return new CatalogueEtape(daoCatalogueEtape.getById(id));
    }

    public List<CatalogueEtape> getAll() {
        return daoCatalogueEtape.getAll().stream()
                .map(CatalogueEtape::new)
                .collect(Collectors.toList());
    }

    public Boolean update(CatalogueEtape obj) {
        return daoCatalogueEtape.update(obj.getCatalogueEtapeEntity());
    }

    public Boolean delete(CatalogueEtape obj) {
        return daoCatalogueEtape.delete(obj.getCatalogueEtapeEntity());
    }

    public List<CatalogueEtape> getSortedCatEtapeByIDCatProc(Integer idCatProc) {
        List<CatalogueEtape> catalogueEtapes = new ArrayList<>();
        daoCatalogueEtape.getByIDCatProc(idCatProc).stream()
                .map(CatalogueEtape::new)
                .collect(Collectors.toList())
                .forEach((catalogueEtape -> catalogueEtapes.add(catalogueEtape)));
        //sort list by numOrder
        catalogueEtapes.sort((Comparator.comparing(catalogueEtape -> catalogueEtape.getCatalogueEtapeEntity().getNumOrdre())));
        return catalogueEtapes;
    }
}