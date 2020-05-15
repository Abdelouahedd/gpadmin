import jdk.swing.interop.SwingInterOpUtils;
import metier.beans.*;
import metier.enumeration.EtatProcessus;
import metier.gestionnaire.GestionnaireCatProc;
import metier.gestionnaire.GestionnaireClient;
import metier.gestionnaire.GestionnaireDemande;

import java.util.List;

public class Main {

    public static void main(String[] args) {
        GestionnaireClient gestionnaireClient = new GestionnaireClient();
        Client client = gestionnaireClient.getByCin("QA2548");
        System.out.println(client);

        Demande demande = client.getDemandeByJeton("s8y6o3d9c8y1r8f4s7e4");
        System.out.println("Demande: " + demande);

        Processus proc = demande.getProcessus();
        System.out.println("Proc: " + proc);

        List<Etape> inactiveEtape = proc.getInactiveEtape();
        inactiveEtape.forEach(System.out::println);

        List<Etape> finished = proc.getFinishedEtape();
        finished.forEach(System.out::println);

        Etape etapeCourante = proc.getEtapeCourante();
        System.out.println("Etape Courant: " + etapeCourante);

        System.out.println("Avancement: " + proc.getAvancementRatio());
    }
}
