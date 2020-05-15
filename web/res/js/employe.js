profileSection = $("#profile-section")
etapesSection = $("#etapes-section") 
profileButton = $("#profile-button")
etapesButton = $("#etapes-button")

profileSection.show();
etapesSection.hide()

profileButton.on('click', function (event) {
    profileSection.show();
    etapesSection.hide();
})

etapesButton.on('click', function (event) {
    profileSection.hide();
    etapesSection.show();
})