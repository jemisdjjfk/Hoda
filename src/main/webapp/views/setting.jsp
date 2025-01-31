<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .center{
                width: 100%;
            }
            .version{
                font-size: 12px;
                color: #ccc;
            }
        </style>
        <link rel="stylesheet" href="<c:url value='/template/css/home.css' />">
        
        <title>Cài đặt | HODA</title>
    </head>
    <body>
        <main class="d-flex" >
            <div class="left"></div>
            <div class="center" style="background: #fff;">
                <ul class="list-group list-group-flush">
                    <li class="btn list-group-item text-start" type="button" data-bs-toggle="collapse" data-bs-target="#selectLangCollapse" aria-expanded="false" aria-controls="selectLangCollapse">Language</li>
                    <div class="collapse multi-collapse" id="selectLangCollapse">
                        <span class="mx-3" style="font-size: 14px; font-weight: 700">Language:</span>
                        <div class="card card-body" style="border:none">

                            <select id="select_Lang" class="form-select" aria-label="Default select example">
                                <c:if test="${sessionScope.lang == 'en-US'}">
                                    <option value="en-US" selected>Engish </option>
                                    <option value="vi-VN" >Tiếng Việt</option>
                                </c:if>
                                <c:if test="${sessionScope.lang == 'vi-VN'}">
                                    <option value="en-US" >Engish </option>
                                    <option value="vi-VN" selected>Tiếng Việt</option>
                                </c:if>
                            </select>
                        </div>
                    </div>
                    <li class="btn list-group-item text-start" type="button" data-bs-toggle="collapse" data-bs-target="#aboutUsCollapse" aria-expanded="false" aria-controls="aboutUsCollapse">About us</li>
                    <div class="collapse multi-collapse" id="aboutUsCollapse">
                        <span class="mx-3" style="font-size: 14px; font-weight: 700">About us:</span>
                        <div class="card card-body" style="border:none">
                            <ul>
                                <li>Lê Hoàng Tú</li>
                                <li>Trần Phan Hoàng Tùng</li>
                                <li>Trương Phúc Vĩnh</li>
                            </ul>
                        </div>
                    </div>
                    <li class="list-group-item"></li>
                </ul>



                <div class="version text-center">-HODA 1.0.0-</div>
            </div>
            <div class="right"></div>
        </main>

    </body>
</html>
