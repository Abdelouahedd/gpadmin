function updateUI (data) {
    console.log(data)
    $("#proc_name").text(data["procedureNom"])
    $("#etape_name").text(data["etapeNom"])
    $("#etape_etat").text(data["etapeEtat"])
    $("#etape_id").text(data["etapeId"])
    $("#etape_ouverture").text(data["etapeOuverture"])
    $("#etape_fermeture").text(data["etapeFermeture"])
    $('#rapports').empty()
    $("#docs").empty()

    if ( data['rapports'].length > 0 ) {
        for (let id in data['rapports'] ) {
            const rapport = data['rapports'][id]['rapportEntity']
            console.warn(rapport)
            let li = $(document.createElement("li"))
            li.attr('class', 'list-group-item')

            let docDiv = $(document.createElement('div'))
            let docLabel = $("<span class='font-weight-bold pr-2'>Doc:</span>")
            let docLink = $(document.createElement('a'))
            docLink.attr('href', 'http://localhost/rapports/' + rapport['filename'])
            docLink.attr('target', '_blank');
            let decision = $(document.createElement('span'))
            decision.attr('class', 'badge badge-primary mx-2')
            decision.text(rapport['decision'])
            docLink.text(rapport['filename'])
            docLabel.appendTo(docDiv)
            docLink.appendTo(docDiv)
            decision.appendTo(docDiv)
            docDiv.appendTo(li)

            let dateDiv = $(document.createElement('div'))
            let dateLabel = $("<span class='font-weight-bold pr-2'>Depo: </span>")
            let dateSpan = $(document.createElement('span'))
            dateSpan.text(rapport['dateDeposition'])
            dateLabel.appendTo(dateDiv)
            dateSpan.appendTo(dateDiv)
            dateDiv.appendTo(li)

            li.appendTo('#rapports')
        }

        if ( data['documents'].length > 0 ) {
            for (let id in data['documents'] ) {
                const doc = data['documents'][id]['documentEntity']
                console.warn(doc)
                let tr = $(document.createElement('tr'))
                let td = $(document.createElement('td'))
                td.attr('class', 'text-center')
                let link = $(document.createElement('a'))
                link.attr('href', 'http://localhost/docs/' + doc['filename'])
                link.attr('target', '_blank')
                link.text(doc['filename'])
                link.appendTo(td)
                td.appendTo(tr)
                tr.appendTo('#docs')
            }
        }
        $("#etape-content").show()
    }

// <li class="list-group-item">
//         <div>
//         <span class="font-weight-bold">Doc:
// </span><span>Doc_01.pdf</span>
//     </div>
//     <div>
//     <span class="font-weight-bold">Depo:</span><span>2020-10-01
//     00:00</span>
//     </div>
//     </li>
}

profileSection = $("#profile-section")
etapesSection = $("#etapes-section")
profileButton = $("#profile-button")
etapesButton = $("#etapes-button")
etapeContent = $("#etape-content")
etapeHint = $("#hint")

profileSection.show()
etapesSection.hide()
etapeContent.hide()
$("#connection").hide()
$("#error").hide()

profileButton.on('click', function (event) {
    profileSection.show();
    etapesSection.hide();
})

etapesButton.on('click', function (event) {
    profileSection.hide();
    etapesSection.show();
})

$('#etapes-sidbar nav a').on('click', function (event) {
    const idEtape = $(this).attr('id');
    $("#connection").show();

    let response = null;
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("demo").innerHTML = xhttp.responseText;
            response = JSON.parse(xhttp.response);
            updateUI(response)
            etapeContent.show();
            $("#connection").hide()
            $("#error").hide()
        } else {
            console.error("Error getting data");
            $("#connection").hide()
            $('#error').show()
            const test = {
                "etapeId": 1204,
                "procedureNom": "PROC_AA",
                "etapeNom": "PROC_AA",
                "etapeEtat": "COURS",
                "etapeOuverture": "2005-07-03 01:00:15.0",
                "etapeFermeture": "2001-03-12 12:11:12.0",
                "rapports": [
                    {
                        "rapportEntity": {
                            "id": 4,
                            "filename": "Rapport_263.pdf",
                            "decision": "REFUSE",
                            "dateDeposition": "Jul 28, 2004, 3:51:18 AM",
                            "idEtape": 263
                        }
                    }
                ],
                "documents": [
                    {
                        "documentEntity": {
                            "id": 1,
                            "filename": "Doc_120438871.pdf",
                            "dateDeposition": "Dec 28, 2000, 9:34:18 PM",
                            "idDemande": 1204
                        }
                    },
                    {
                        "documentEntity": {
                            "id": 2,
                            "filename": "Doc_120438872.pdf",
                            "dateDeposition": "Jan 26, 2004, 8:52:46 PM",
                            "idDemande": 1204
                        }
                    }
                ]
            }
            updateUI(test)
        }
    };
    xhttp.open("GET", "http://localhost/api/etapes/23", false);
    xhttp.send();
})