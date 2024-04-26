<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2024-04-25
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>admin >> memberList</title>

    <%--  header 부트스트랩  --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" rel="stylesheet"/>
    <link href="/resources/css/admin/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <%-- memberList 부트스트랩   --%>
<%--    <link href="/resources/css/admin/styles.css" rel="stylesheet" />--%>
<%--    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<%--    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>--%>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
</head>
<body>
    <%@ include file="/WEB-INF/common/header.jsp"%>
    <div class="d-flex" id="wrapper" style="padding-top: 92px;">
        <!-- Sidebar-->
        <div class="border-end bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom bg-light">관리자 페이지</div>
            <div class="list-group list-group-flush">
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">회원내역</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">공지사항</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">FAQ</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">QnA</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">도서(교재)</a>
            </div>
        </div>
        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <button class="btn btn-primary" id="sidebarToggle">
                <i class="fa fa-arrow-left" aria-hidden="true" style="display: block;"></i>
                <i class="fa fa-arrow-right" aria-hidden="true" style="display: none;"></i>
            </button>
            <!-- Page content-->
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title text-uppercase mb-0">Manage Users</h5>
                            </div>
                            <div class="table-responsive">
                                <table class="table no-wrap user-table mb-0">
                                    <thead>
                                    <tr>
                                        <th scope="col" class="border-0 text-uppercase font-medium pl-4">#</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">Name</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">Occupation</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">Email</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">Added</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">Category</th>
                                        <th scope="col" class="border-0 text-uppercase font-medium">Manage</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="pl-4">1</td>
                                        <td>
                                            <h5 class="font-medium mb-0">Daniel Kristeen</h5>
                                            <span class="text-muted">Texas, Unitedd states</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">Visual Designer</span><br>
                                            <span class="text-muted">Past : teacher</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">daniel@website.com</span><br>
                                            <span class="text-muted">999 - 444 - 555</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">15 Mar 1988</span><br>
                                            <span class="text-muted">10: 55 AM</span>
                                        </td>
                                        <td>
                                            <select class="form-control category-select" id="exampleFormControlSelect1">
                                                <option>Modulator</option>
                                                <option>Admin</option>
                                                <option>User</option>
                                                <option>Subscriber</option>
                                            </select>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle"><i class="fa fa-key"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-trash"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-edit"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-upload"></i> </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pl-4">2</td>
                                        <td>
                                            <h5 class="font-medium mb-0">Emma Smith</h5>
                                            <span class="text-muted">Texas, Unitedd states</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">Visual Designer</span><br>
                                            <span class="text-muted">Past : teacher</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">daniel@website.com</span><br>
                                            <span class="text-muted">999 - 444 - 555</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">15 Mar 1855</span><br>
                                            <span class="text-muted">10: 00 AM</span>
                                        </td>
                                        <td>
                                            <select class="form-control category-select" id="exampleFormControlSelect1">
                                                <option>Modulator</option>
                                                <option>Admin</option>
                                                <option>User</option>
                                                <option>Subscriber</option>
                                            </select>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle"><i class="fa fa-key"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-trash"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-edit"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-upload"></i> </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pl-4">3</td>
                                        <td>
                                            <h5 class="font-medium mb-0">Olivia Johnson</h5>
                                            <span class="text-muted">Texas, Unitedd states</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">Visual Designer</span><br>
                                            <span class="text-muted">Past : teacher</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">daniel@website.com</span><br>
                                            <span class="text-muted">999 - 444 - 555</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">17 Aug 1988</span><br>
                                            <span class="text-muted">12: 55 AM</span>
                                        </td>
                                        <td>
                                            <select class="form-control category-select" id="exampleFormControlSelect1">
                                                <option>Modulator</option>
                                                <option>Admin</option>
                                                <option>User</option>
                                                <option>Subscriber</option>
                                            </select>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle"><i class="fa fa-key"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-trash"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-edit"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-upload"></i> </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pl-4">4</td>
                                        <td>
                                            <h5 class="font-medium mb-0">Isabella Williams</h5>
                                            <span class="text-muted">Texas, Unitedd states</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">Visual Designer</span><br>
                                            <span class="text-muted">Past : teacher</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">daniel@website.com</span><br>
                                            <span class="text-muted">999 - 444 - 555</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">26 Mar 1999</span><br>
                                            <span class="text-muted">10: 55 AM</span>
                                        </td>
                                        <td>
                                            <select class="form-control category-select" id="exampleFormControlSelect1">
                                                <option>Modulator</option>
                                                <option>Admin</option>
                                                <option>User</option>
                                                <option>Subscriber</option>
                                            </select>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle"><i class="fa fa-key"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-trash"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-edit"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-upload"></i> </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pl-4">5</td>
                                        <td>
                                            <h5 class="font-medium mb-0">Sophia Jones</h5>
                                            <span class="text-muted">Texas, Unitedd states</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">Visual Designer</span><br>
                                            <span class="text-muted">Past : teacher</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">daniel@website.com</span><br>
                                            <span class="text-muted">999 - 444 - 555</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">16 Aug 2001</span><br>
                                            <span class="text-muted">10: 55 AM</span>
                                        </td>
                                        <td>
                                            <select class="form-control category-select" id="exampleFormControlSelect1">
                                                <option>Modulator</option>
                                                <option>Admin</option>
                                                <option>User</option>
                                                <option>Subscriber</option>
                                            </select>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle"><i class="fa fa-key"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-trash"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-edit"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-upload"></i> </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="pl-4">6</td>
                                        <td>
                                            <h5 class="font-medium mb-0">Charlotte Brown</h5>
                                            <span class="text-muted">Texas, Unitedd states</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">Visual Designer</span><br>
                                            <span class="text-muted">Past : teacher</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">daniel@website.com</span><br>
                                            <span class="text-muted">999 - 444 - 555</span>
                                        </td>
                                        <td>
                                            <span class="text-muted">15 Mar 1988</span><br>
                                            <span class="text-muted">10: 55 AM</span>
                                        </td>
                                        <td>
                                            <select class="form-control category-select" id="exampleFormControlSelect1">
                                                <option>Modulator</option>
                                                <option>Admin</option>
                                                <option>User</option>
                                                <option>Subscriber</option>
                                            </select>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle"><i class="fa fa-key"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-trash"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-edit"></i> </button>
                                            <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-upload"></i> </button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>
    <%@ include file="/WEB-INF/common/footer.jsp"%>
</body>
</html>
