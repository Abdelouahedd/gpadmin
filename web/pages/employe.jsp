<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set scope="session" var="employe" value="${sessionScope['user']}"/>
<c:set var="catEtapes" value="${requestScope['catEtapes']}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employe</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="res/css/employe.css">
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top shadow">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <svg class="bi bi-house-door mr-3" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                 xmlns="http://www.w3.org/2001/svg">
                <path fill-rule="evenodd"
                      d="M7.646 1.146a.5.5 0 01.708 0l6 6a.5.5 0 01.146.354v7a.5.5 0 01-.5.5H9.5a.5.5 0 01-.5-.5v-4H7v4a.5.5 0 01-.5.5H2a.5.5 0 01-.5-.5v-7a.5.5 0 01.146-.354l6-6zM2.5 7.707V14H6v-4a.5.5 0 01.5-.5h3a.5.5 0 01.5.5v4h3.5V7.707L8 2.207l-5.5 5.5z"
                      clip-rule="evenodd"/>
                <path fill-rule="evenodd" d="M13 2.5V6l-2-2V2.5a.5.5 0 01.5-.5h1a.5.5 0 01.5.5z"
                      clip-rule="evenodd"/>
            </svg>
            GPAdmin
        </a>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <span class="nav-link text-light">Hi <c:out value="${employe.getFullName()}"/> !</span>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid bg-gray">
    <div class="row">
        <div id="sidebar" class="col-sm-2 sticy-left p-0">
            <button id="profile-button" class="btn btn-block">
                <svg class="bi bi-person-plus mr-2" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M11 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM1.022 13h9.956a.274.274 0 00.014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 00.022.004zm9.974.056v-.002.002zM6 7a2 2 0 100-4 2 2 0 000 4zm3-2a3 3 0 11-6 0 3 3 0 016 0zm4.5 0a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 010-1H13V5.5a.5.5 0 01.5-.5z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd" d="M13 7.5a.5.5 0 01.5-.5h2a.5.5 0 010 1H14v1.5a.5.5 0 01-1 0v-2z"
                          clip-rule="evenodd"/>
                </svg>
                Profile
            </button>
            <button id="etapes-button" class="btn btn-block">
                <svg class="bi bi-folder-plus mr-2" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M9.828 4H2.19a1 1 0 00-.996 1.09l.637 7a1 1 0 00.995.91H9v1H2.826a2 2 0 01-1.991-1.819l-.637-7a1.99 1.99 0 01.342-1.31L.5 3a2 2 0 012-2h3.672a2 2 0 011.414.586l.828.828A2 2 0 009.828 3h3.982a2 2 0 011.992 2.181L15.546 8H14.54l.265-2.91A1 1 0 0013.81 4H9.828zm-2.95-1.707L7.587 3H2.19c-.24 0-.47.042-.684.12L1.5 2.98a1 1 0 011-.98h3.672a1 1 0 01.707.293z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd"
                          d="M13.5 10a.5.5 0 01.5.5v2a.5.5 0 01-.5.5h-2a.5.5 0 010-1H13v-1.5a.5.5 0 01.5-.5z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd" d="M13 12.5a.5.5 0 01.5-.5h2a.5.5 0 010 1H14v1.5a.5.5 0 01-1 0v-2z"
                          clip-rule="evenodd"/>
                </svg>
                Gerer Etape
            </button>
            <button class="btn btn-block"><a class="unstyled-link" href='logout'>
                <svg class="bi bi-reply-all mr-2" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
                     xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M8.002 5.013a.144.144 0 00-.202.134V6.3a.5.5 0 01-.5.5c-.667 0-2.013.005-3.3.822-.984.624-1.99 1.76-2.595 3.876C2.425 10.515 3.59 9.982 4.61 9.7a8.741 8.741 0 011.921-.306 7.403 7.403 0 01.798.008h.013l.005.001h.001L7.3 9.9l.05-.498a.5.5 0 01.45.498v1.153c0 .108.11.176.202.134l3.984-2.933a.494.494 0 01.042-.028.147.147 0 000-.252.494.494 0 01-.042-.028L8.002 5.013zM6.8 10.386a7.745 7.745 0 00-1.923.277c-1.326.368-2.896 1.201-3.94 3.08a.5.5 0 01-.933-.305c.464-3.71 1.886-5.662 3.46-6.66 1.245-.79 2.527-.942 3.336-.971v-.66a1.144 1.144 0 011.767-.96l3.994 2.94a1.147 1.147 0 010 1.946l-3.994 2.94a1.144 1.144 0 01-1.767-.96v-.667z"
                          clip-rule="evenodd"/>
                    <path fill-rule="evenodd"
                          d="M10.868 4.293a.5.5 0 01.7-.106l3.993 2.94a1.147 1.147 0 010 1.946l-3.994 2.94a.5.5 0 01-.593-.805l4.012-2.954a.493.493 0 01.042-.028.147.147 0 000-.252.496.496 0 01-.042-.028l-4.012-2.954a.5.5 0 01-.106-.699z"
                          clip-rule="evenodd"/>
                </svg>
                Logout
            </a></button>
        </div>
        <div class="col-sm-10">
            <div class="container mt-3 py-0 bg-gray">

                <div id="profile-section" class="row">
                    <div class="col-sm-4">
                        <div class="card border rounded shadow">
                            <img src="res/img/user.png" alt="profile image" class="card-img-top">
                            <div class="card-body">
                                <h4 class="font-weight-bold text-center"><c:out value="${employe.getFullName()}"/></h4>
                                <div class="d-flex justify-content-around">
                                    <span class="text-center font-weight-bold">Nom</span>
                                    <span class="text-center"><c:out value="${employe.getNom()}"/> </span>
                                </div>
                                <div class="d-flex justify-content-around">
                                    <span class="text-center font-weight-bold">Prenom</span>
                                    <span class="text-center"><c:out value="${employe.getPrenom()}"/></span>
                                </div>
                                <div class="d-flex justify-content-around">
                                    <span class="text-center font-weight-bold">Cin</span>
                                    <span class="text-center"><c:out value="${employe.getCin()}"/></span>
                                </div>
                                <div class="d-flex justify-content-around">
                                    <span class="text-center font-weight-bold">Poste</span>
                                    <span class="text-center">Employee</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="offset-sm-1 col-sm-6 rounded">
                        <div class="card shadow border">

                            <div class="card-header bg-gray text-primary text-center">
                                <div>
                                    <span class="badge badge-primary float-right">Total: <c:out value="${catEtapes.size()}"/></span>
                                    <p class="font-weight-bold">Le Catalogue des etapes qui vous sont affecte</p>
                                    <p class="text-dark">(Basculez pour voir plus)</p>
                                </div>
                            </div>
                            <div class="card-body bg-transparent p-0">
                                <ul id="liste-etape" class="list-group bg-transparent m-0">
                                    <c:forEach items="${catEtapes}" var="catEtape">
                                    <li class="list-group-item text-center bg-transparent"><c:out value="${catEtape.getLibelle()}"/></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="etapes-section" class="row m-0">
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <div class="d-flex justify-content-center">
                                    <div class="card">
                                        <div class="card-header bg-white">
                                            <p class="text-dark"><span
                                                    class="font-weight-bold text-primary">Hint:</span>
                                                Selectionnez une Etape puis une instance d'un client (Faites les
                                                modifications necessaire)
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-3">

                            <!-- etape side bar -->
                            <div class="col-sm-3 m-0 p-0">
                                <nav id="etapes-sidbar" class="nav flex-column m-0 p-0 border shadow bg-white">
                                    <div id="nav-header" class="p-2 text-primary bg-gray">
                                        <h4>Ensemble des Etapes</h4>
                                    </div>
                                    <ul class="list-unstyled">
                                        <li>
                                            <a href="#first-collapse"
                                               class="btn btn-block custom-btn etape-btn text-dark"
                                               data-toggle="collapse">First
                                                Etape <span class="badge badge-dark">3</span></a>
                                            <nav id="first-collapse" class="nav nav-tabs flex-column collapse"
                                                 data-toggle="collapse" role="tablist">
                                                <a href="#first-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">First Tab</a>
                                                <a href="#second-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">Second Tab</a>
                                                <a href="#third-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">Third tab</a>
                                            </nav>
                                        </li>
                                        <li>
                                            <a href="#second-collapse"
                                               class="btn btn-block custom-btn etape-btn text-dark"
                                               data-toggle="collapse">Second Etape<span
                                                    class="badge badge-dark">3</span></a>
                                            <nav id="second-collapse" class="nav nav-tabs flex-column collapse"
                                                 data-toggle="collapse" role="tablist">
                                                <a href="#first-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">First Tab</a>
                                                <a href="#second-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">Second Tab</a>
                                                <a href="#third-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">Third tab</a>
                                            </nav>
                                        </li>
                                        <li>
                                            <a href="#third-collapse"
                                               class="btn btn-block custom-btn etape-btn text-dark"
                                               data-toggle="collapse">Third Etape<span
                                                    class="badge badge-dark">3</span></a>
                                            <nav id="third-collapse" class="nav nav-tabs flex-column collapse"
                                                 data-toggle="collapse" role="tablist">
                                                <a href="#first-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">First Tab</a>
                                                <a href="#second-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">Second Tab</a>
                                                <a href="#third-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">Third tab</a>
                                            </nav>
                                        </li>
                                        <li>
                                            <a href="#fourth-collapse"
                                               class="btn btn-block custom-btn etape-btn text-dark"
                                               data-toggle="collapse">Fourth Etape</a>
                                            <nav id="fourth-collapse" class="nav nav-tabs flex-column collapse"
                                                 data-toggle="collapse" role="tablist">
                                                <a href="#first-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">First Tab</a>
                                                <a href="#second-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">Second Tab</a>
                                                <a href="#third-tab"
                                                   class="btn btn-block custom-btn etape-btn-selected nav-item nav-link text-dark"
                                                   role="presentation" data-toggle="tab">Third tab</a>
                                            </nav>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            <!-- etape content -->
                            <div class="col-sm-9 tab-content px-1 m-0 shadow bg-gray" id="tab-content">
                                <div id="first-tab" class="tab-pane fade show" role="tabpanel">
                                    <div class="row my-4">
                                        <div class="offset-md-1 col-md-5 label-box">
                                            <span class="font-weight-bold label-box-key">Procedure:</span><span
                                                class="label-box-value">Nom Procedure</span>
                                        </div>
                                        <div class="offset-md-1 col-md-3 label-box">
                                            <span class="font-weight-bold label-box-key">Etape: </span><span
                                                class="label-box-value">Nom Etape</span>
                                        </div>
                                    </div>

                                    <div class="row mt-4">
                                        <div class="offset-sm-1 col-sm-6">
                                            <div class="card">
                                                <div class="card-header d-flex flex-column">
                                                    <div class="d-flex justify-content-around">
                                                        <span class="text-right font-weight-bold">Etape ID:</span>
                                                        <span class="text-left">!@#@#@</span></div>
                                                    <div class="d-flex justify-content-around">
                                                        <span class="text-right font-weight-bold">Etat: </span>
                                                        <span class="text-left">Attente</span></div>
                                                    <div class="d-flex justify-content-around">
                                                        <span class="text-right font-weight-bold">Ouverture</span>
                                                        <span class="text-left">2020-10-20 20:20</span></div>
                                                    <div class="d-flex justify-content-around">
                                                        <span class="text-right font-weight-bold">Fermeture</span>
                                                        <span class="text-left">2020-10-20 20:20</span></div>
                                                </div>
                                                <div class="card-body">
                                                    <form action="UpdateEtat" class="d-flex justify-content-between">
                                                        <input type="submit" name="valider"
                                                               class="btn btn-outline-success"
                                                               value="Valider">
                                                        <input type="submit" name="refuser"
                                                               class="btn btn-outline-warning"
                                                               value="refuser">
                                                        <input type="submit" name="rejeter"
                                                               class="btn btn-outline-danger"
                                                               value="rejeter">
                                                    </form>
                                                </div>
                                                <div class="card-footer">
                                                    <h4 class="text-left font-weight-bold">Rapports</h4>
                                                    <div class="d-flex flex-column">
                                                        <ul class="list-group unstyled-list">
                                                            <li class="list-group-item">
                                                                <div><span class="font-weight-bold">Doc:
                                                                </span><span>Doc_01.pdf</span></div>
                                                                <div></div>
                                                                <span class="font-weight-bold">Depo:</span><span>2020-10-01
                                                                00:00</span>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <div><span class="font-weight-bold">Doc:
                                                                </span><span>Doc_02.pdf</span></div>
                                                                <div></div>
                                                                <span class="font-weight-bold">Depo:</span><span>2020-10-02
                                                                00:00</span>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <div><span class="font-weight-bold">Doc:
                                                                </span><span>Doc_03.pdf</span></div>
                                                                <div></div>
                                                                <span class="font-weight-bold">Depo:</span><span>2020-10-03
                                                                00:00</span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="py-4 col-sm-4 offset-sd-1 mt-0 pt-0">
                                            <table class="table table-hover">
                                                <thead class="label-box-key text-center">
                                                <tr>
                                                    <th>Documents</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="text-center">doc_01.pdf</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">doc_02.pdf</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">doc_03.pdf</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">doc_04.pdf</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">doc_05.pdf</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">doc_06.pdf</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-center">doc_07.pdf</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div id="fifth-tab" class="tab-pane fade" role="tabpanel">
                                    <p>fifth tab</p>
                                </div>
                                <div id="second-tab" class="tab-pane fade" role="tabpanel">
                                    <p>second tabe</p>
                                </div>
                                <div id="third-tab" class="tab-pane fade" role="tabpanel">
                                    <p>third tab</p>
                                </div>
                                <div id="fourth-tab" class="tab-pane fade" role="tabpanel">
                                    <p>fourth tab</p>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>

<footer class="py-1 bg-dark text-white fixed-bottom">
    <div class="container text-center">
        <small>Copyright &copy; GPAdmin </small>
    </div>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>

<script src="res/js/employe.js"></script>
</body>

</html>