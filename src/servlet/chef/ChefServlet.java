package servlet.chef;

import metier.beans.CatalogueEtape;
import metier.beans.ChefDivision;
import metier.beans.Employee;
import metier.beans.Etape;
import metier.gestionnaire.GestionnaireCatEtap;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

public class ChefServlet extends HttpServlet {
    private GestionnaireCatEtap gestionnaireCatEtap = new GestionnaireCatEtap();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ChefDivision chef = (ChefDivision) session.getAttribute("user");
        List<CatalogueEtape> catalogueEtapes = gestionnaireCatEtap.getCatEtapeByEMP(chef);

        List<Etape> etapes = chef.getEtapes();
        if ( etapes != null ) {
            Set<String> etapesNames = Util.filterCatNames(etapes);
            HashMap<String, List<Etape>> etapesMap = new HashMap<>(etapesNames.size());
            etapesNames.forEach(name -> etapesMap.put(name, Util.filterByLibelle(etapes, name)));
            req.setAttribute("etapesMap", etapesMap);
        } else {
            req.setAttribute("etapesMap", null);
        }

        req.setAttribute("catEtapes", catalogueEtapes);
        this.getServletContext().getRequestDispatcher("/pages/chef.jsp").forward(req, resp);
    }
}
