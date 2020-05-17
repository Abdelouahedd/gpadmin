package servlet.employe;

import metier.beans.CatalogueEtape;
import metier.beans.Demande;
import metier.beans.Employee;
import metier.gestionnaire.GestionnaireCatEtap;
import metier.gestionnaire.GestionnaireDemande;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class EmployeServlet extends HttpServlet {
    private GestionnaireCatEtap gestionnaireCatEtap = new GestionnaireCatEtap();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Employee employee = (Employee) session.getAttribute("user");
        List<CatalogueEtape> catalogueEtapes = gestionnaireCatEtap.getCatEtapeByEMP(employee);



        req.setAttribute("catEtapes", catalogueEtapes);
        this.getServletContext().getRequestDispatcher("/pages/employe.jsp").forward(req, resp);
    }
}
