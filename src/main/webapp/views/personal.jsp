<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<c:url value='/template/css/post.css' />">
        <link rel="stylesheet" href="<c:url value='/template/css/home.css' />">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <style>
            .fixed-top, .fixed-bottom{
                z-index: auto
            }

            .switch {
                /* position: relative; */
                width: fit-content;
                height: 100%;
            }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .slider {
                /* position: absolute; */
                cursor: pointer;
                width: fit-content;
                height: fit-content;
                background-color: #fff;
                border-radius: 3px;
                padding: 5px 35px;
                transition: .3s;
                font-size: 15px;
                font-weight: 600;
                color: #000;
                border: 1px solid;
            }


            input:checked+.slider {
                background-color: #1d9000;
                color: #fff;
            }
        </style>
        <title>Trang cá nhân</title>
    </head>

    <body lang="${sessionScope.lang}">
        <main id="personal">
            <div class="info-person">
                <div class="main-info">
                    <div class="info-top">
                        <div class="left-side">
                            <div class="img-person radius-100">
                                <img src="${requestScope.USER.getProfileModel().getAvatar()}" alt="">
                            </div>
                        </div>
                        <div class="right-side">
                            <div class="person-name">
                                <span>${requestScope.USER.getProfileModel().getFullName()}</span>
                            </div>
                            <div class="info-follow">
                                <a style="color: #535353;" href="/personal/follow?id=${requestScope.USER.getId()}">
                                    <p><span class="num-follower">${requestScope.FOLLOWERS.size()}</span> <span label-lang="PERSONAL_TXT_FOLLOWER" class="multilang"></span></p>
                                    <p><span label-lang="PERSONAL_TXT_FOLLOWING_1" class="multilang"></span> <span class="num-following">${requestScope.FOLLOWINGS.size()}</span> <span label-lang="PERSONAL_TXT_FOLLOWING_2" class="multilang"></span></p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <c:if test="${sessionScope.account.getId()==requestScope.USER.getId()}">
                        <div class="update-info">
                            <a href="/update/info?id=${sessionScope.account.getId()}">
                                <button><span label-lang="PERSONAL_BTN_UPDATEINFO" class="multilang"></span></button>
                            </a>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.account.getId()!=requestScope.USER.getId() and not empty sessionScope.account}">
                        <div class="update-info">
                            <label class="switch btn-follow-user" id="btn-followUser_${requestScope.USER.getId()}" 
                                   onmousedown="dataFollowUser(${sessionScope.account.getId()}, ${requestScope.USER.getId()}, '${sessionScope.lang}')">
                                <input type="checkbox" id="chb-follower_${requestScope.USER.getId()}"
                                       <c:if test="${requestScope.ISFOLLOW == false}">checked</c:if>>
                                <label class="slider" for="chb-follower_${requestScope.USER.getId()}"><span style="pointer-events: none;" label-lang="PERSONAL_BTN_FOLLOW" class="multilang"></span></label>
                            </label>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="main-content">
                <div class="wrapper">
                    <div class="tabs">
                        <div class="tab">
                            <input type="radio" name="css-tabs" id="tab-1" checked class="tab-switch">
                            <label for="tab-1" class="tab-label"><span label-lang="PERSONAL_TAB_POSTS" class="multilang"></span></label>
                            <div class="tab-content">
                                <div class="list-post">
                                    <c:forEach items="${requestScope.POSTS}" var="post">
                                        <div class="post pt-2" id="post_${post.getId()}">
                                            <div class="header-post">
                                                <nav class="navbar navbar-expand ps-2 pe-2 gap-2">
                                                    <a href="/personal?id=${post.getUserid()}" style="text-decoration: none">
                                                        <img src="<c:url value='${post.getUserModel().getProfileModel().getAvatar()}' />" class="d-block rounded-circle" alt=""
                                                             style="height: 35px; width: 35px;">
                                                    </a>
                                                    <div>
                                                        <a href="/personal?id=${post.getUserid()}" style="text-decoration: none; color: black;">
                                                            <h5>${post.getUserModel().getProfileModel().getFullName()}</h5>
                                                        </a>
                                                        <p>${post.getCreatedTime()}</p>
                                                    </div>

                                                    <ul class="navbar-nav ms-auto gap-3" id="list-header">

                                                        <li class="nav-item">
                                                            <button class="d-block menu-post" id="menu-list_${post.getId()}">
                                                                <svg>
                                                                <use xlink:href="#icon-ellipsis" />
                                                                </svg>
                                                                <svg style="display: none;" xmlns="http://www.w3.org/2000/svg" version="1.1">
                                                                <symbol id="icon-ellipsis" viewBox="0 0 448 512"
                                                                        xmlns="http://www.w3.org/2000/svg">
                                                                    <path
                                                                        d="M120 256c0 30.9-25.1 56-56 56s-56-25.1-56-56s25.1-56 56-56s56 25.1 56 56zm160 0c0 30.9-25.1 56-56 56s-56-25.1-56-56s25.1-56 56-56s56 25.1 56 56zm104 56c-30.9 0-56-25.1-56-56s25.1-56 56-56s56 25.1 56 56s-25.1 56-56 56z" />
                                                                </symbol>

                                                                </svg>
                                                            </button>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                            <!-- BOOTOM SHEET MODAL -->
                                            <div id="menu-post_${post.getId()}" tabindex="-1" class="overlay">
                                                <aside class="social" role="dialog" aria-labelledby="modal-label" aria-hidden="true">
                                                    <a href="#" class="btn-close" aria-hidden="true"><span class="mdi mdi-close"></span><span
                                                            class="sr-only">Close</span></a>
                                                    <ul class="list-group list-group-flush">
                                                        <c:if test="${sessionScope.account.getId() == post.getUserid()}">
                                                            <div class="list-group-item btn btn-updatePost" id="btn-updatePost_${post.getId()}"><span label-lang="POST_BOTTOMSHEET_POST_EDIT" class="multilang"></span></div>
                                                            <div class="list-group-item btn text-danger btn-deletePost" id="btn-deletePost_${post.getId()}"><span label-lang="POST_BOTTOMSHEET_POST_DELETE" class="multilang"></span></div>
                                                            </c:if>
                                                            <c:if test="${sessionScope.account.getId() != post.getUserid()}">
                                                            <div class="list-group-item btn">Ẩn bài viết này</div>
                                                            <div class="list-group-item btn">Chặn bài viết từ người dùng này</div>
                                                            <div id="btn-report_${post.getId()}" class="list-group-item btn text-danger btn-report"><span label-lang="POST_BOTTOMSHEET_POST_REPORT" class="multilang"></span></div>
                                                            </c:if>
                                                    </ul>
                                                </aside>
                                            </div>


                                            <div class="content-post p-2">
                                                <div class="post-category post-category_${post.getId()}" id="post-category_${post.getCategoryid()}">
                                                    <c:if test="${sessionScope.lang == 'en-US'}">${post.getCategoryModel().getNameEng()}</c:if>
                                                    <c:if test="${sessionScope.lang == 'vi-VN'}">${post.getCategoryModel().getName()}</c:if>
                                                    </div>
                                                    <h6>${post.getTitle()}</h6>
                                                <p>
                                                    <a data-bs-toggle="collapse" href="#collapseContent_${post.getId()}" aria-expanded="false"
                                                       aria-controls="collapseContent_${post.getId()}">
                                                        <span label-lang="POST_VIEW_CONTENT" class="multilang"></span>
                                                    </a>
                                                </p>
                                                <div class="collapse" id="collapseContent_${post.getId()}">
                                                    <div class="card card-body" style="width:100%; margin: 0; padding: 0; border: 0;">
                                                        ${post.getContent()}
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="image-post">
                                                <c:if test="${not empty post.getImageModels()}">
                                                    <div id="carouselImagePost_${post.getId()}" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                                        <c:if test="${post.getImageModels().size() > 1}">
                                                            <div class="carousel-indicators">
                                                                <c:forEach items="${post.getImageModels()}" var="imgPost" varStatus="loop">
                                                                    <button type="button" data-bs-target="#carouselImagePost_${post.getId()}" data-bs-slide-to="${loop.index}" class="<c:if test="${loop.index == 1}">active</c:if>" aria-current="true" aria-label="Slide 1"></button>
                                                                </c:forEach>
                                                            </div>
                                                        </c:if>
                                                        <div class="carousel-inner">
                                                            <c:forEach items="${post.getImageModels()}" var="imgPost" varStatus="loop">
                                                                <div class="carousel-item <c:if test="${loop.index == 0}">active</c:if>" data-bs-interval="10000">
                                                                    <img src="${imgPost.getUrl()}" class="d-block" alt="...">
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                        <c:if test="${post.getImageModels().size() > 1}">
                                                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselImagePost_${post.getId()}"" data-bs-slide="prev">
                                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                                <span class="visually-hidden">Previous</span>
                                                            </button>
                                                            <button class="carousel-control-next" type="button" data-bs-target="#carouselImagePost_${post.getId()}"" data-bs-slide="next">
                                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                                <span class="visually-hidden">Next</span>
                                                            </button>
                                                        </c:if>
                                                    </div>
                                                </c:if>
                                            </div>
                                            <c:set var="totalLike" scope="session" value="${0}"/>
                                            <c:set var="totalDislike" scope="session" value="${0}"/>
                                            <c:set var="like" scope="session" value=" "/>

                                            <c:forEach items="${post.getInteractModels()}" var="interact" varStatus="loop">
                                                <c:if test="${interact.getFeelModel().getId()!=0 && interact.getFeelModel().getStatus()==1 }">
                                                    <c:if test="${interact.getUserModel().getId() == sessionScope.account.getId()}">
                                                        <c:set var="like" scope="session" value="green"/>
                                                    </c:if>
                                                    <c:set var="totalLike" scope="session" value="${totalLike+1}"/>
                                                </c:if>
                                            </c:forEach>

                                            <c:set var="dislike" scope="session" value=" "/>
                                            <c:forEach items="${post.getInteractModels()}" var="interact" varStatus="loop">
                                                <c:if test="${interact.getFeelModel().getId()!=0 && interact.getFeelModel().getStatus()==0 }">
                                                    <c:if test="${interact.getUserModel().getId() == sessionScope.account.getId()}">
                                                        <c:set var="dislike" scope="session" value="green"/>
                                                    </c:if>
                                                    <c:set var="totalDislike" scope="session" value="${totalDislike+1}"/>
                                                </c:if>
                                            </c:forEach>
                                            <div class="interact-post d-flex flex-row p-2">
                                                <div class="d-flex justify-content-start">
                                                    <button class="${like} btn-like d-block pe-2" id="btn-like_id_${post.getId()}" onclick="like(${sessionScope.account.getId()},${post.getId()})">
                                                        <span class="material-symbols-outlined">
                                                            thumb_up_off
                                                        </span>
                                                    </button>
                                                    <p class="pe-3" id="total-like_id_${post.getId()}">${totalLike}</p>
                                                    <button class="${dislike} btn-dislike d-block pe-2" id="btn-dislike_id_${post.getId()}" onclick="dislike(${sessionScope.account.getId()},${post.getId()})">
                                                        <span class="material-symbols-outlined">
                                                            thumb_down
                                                        </span>
                                                    </button>
                                                    <p class="pe-3" id="total-dislike_id_${post.getId()}">${totalDislike}</p>
                                                    <button class="btn-comment d-block pe-2" id="btn-comment_id_${post.getId()}" onclick="openComment(${post.getId()})" data-bs-toggle="modal" data-bs-target="#modalComment_pid_${post.getId()}">
                                                        <span class="material-symbols-outlined">
                                                            chat_bubble
                                                        </span>
                                                    </button>
                                                    <p class="pe-3" id="total-comment_id_${post.getId()}">0</p>
                                                </div>
                                                <div class="footer-post d-flex flex-row">                        
                                                    <div id="modalComment_pid_${post.getId()}" class="modal fade" role="dialog" tabindex="-1">
                                                        <div class="modal-dialog modal-dialog-centered mx-auto p-0">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5>Bình luận</h5>
                                                                    <button type="button" class="btn-close d-block" id="btn-close_id_${post.getId()}" data-bs-dismiss="modal" onclick="closeComment(${post.getId()})"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="comment-post">
                                                                        <ul class="list-comment p-0">
                                                                            <c:forEach items="${post.getInteractModels()}" var="interact" varStatus="loop">
                                                                                <c:if test="${interact.getCommentModel().getId()!=0}">
                                                                                    <li class="d-flex flex-row" id="comment_${interact.getCommentModel().getId()}">
                                                                                        <div class="pe-2">
                                                                                            <img src="<c:url value='${interact.getUserModel().getProfileModel().getAvatar()}' />"
                                                                                                 class="d-block rounded-circle" alt=""
                                                                                                 style="height: 30px; width: 30px;">
                                                                                        </div>
                                                                                        <div class="d-flex flex-column" id="comment_${interact.getId()}_${post.getId()}_${interact.getUserId()}">
                                                                                            <!--${sessionScope.account.getProfileModel().getFullName()}-->
                                                                                            <div class="user-comment"><b>${interact.getUserModel().getProfileModel().getFullName()}</b></div>
                                                                                            <div class="time-comment">${interact.getCommentModel().getCreatedTime()}</div>
                                                                                            <div class="content-comment">${interact.getCommentModel().getContent()}</div>
                                                                                        </div>
                                                                                        <c:if test="${sessionScope.account.getId() == interact.getUserId()}">
                                                                                            <div class="navbar navbar-expand ms-auto">

                                                                                                <ul class="navbar-nav">

                                                                                                    <li class="nav-item dropdown">
                                                                                                        <a class="nav-link" data-bs-toggle="dropdown">
                                                                                                            <button class="btn-comment d-block pe-2" >
                                                                                                                <span class="material-symbols-outlined">
                                                                                                                    more_horiz
                                                                                                                </span>
                                                                                                            </button>
                                                                                                        </a>

                                                                                                        <ul class="dropdown-menu dropdown-menu-end">
                                                                                                            <li onclick="sendCommentToInput(${interact.getId()},${post.getId()},${interact.getUserId()},${sessionScope.account.getId()}, ${interact.getCommentModel().getId()})"><a class="dropdown-item">Chỉnh sửa bình luận</a></li>
                                                                                                            <li><a class="dropdown-item" onclick="deleteComment(${interact.getId()},${interact.getCommentModel().getId()})">Xóa bình luận</a></li>
                                                                                                        </ul>
                                                                                                    </li>
                                                                                                </ul>
                                                                                            </div>
                                                                                        </c:if>
                                                                                    </li>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer p-2 d-block">
                                                                    <c:if test="${not empty sessionScope.account}">
                                                                        <nav class="navbar navbar-expand p-2">
                                                                            <img src="<c:url value='/template/images/Ellipse 20.png' />" class="d-block rounded-circle" alt=""
                                                                                 style="height: 28px; width: 28px;">
                                                                            <form id="form-comment_${post.getId()}">
                                                                                <input class="add-comment" id="content-comment_id_${post.getId()}" name="content" type="text" value=""
                                                                                       placeholder="Thêm bình luận...">
                                                                                <input type="hidden" name="pid" value="${post.getId()}">
                                                                                <input type="hidden" name="uid" value="${sessionScope.account.getId()}">
                                                                            </form>
                                                                            <ul class="navbar-nav ms-auto gap-4">
                                                                                <li class="nav-item">
                                                                                    <button class="d-block">
                                                                                        <svg>
                                                                                        <use xlink:href="#icon-emoji" />
                                                                                        </svg>
                                                                                        <svg style="display: none;" xmlns="http://www.w3.org/2000/svg"
                                                                                             version="1.1">
                                                                                        <symbol id="icon-emoji" viewBox="0 0 512 512"
                                                                                                xmlns="http://www.w3.org/2000/svg">
                                                                                            <path
                                                                                                d="M256 352C293.2 352 319.2 334.5 334.4 318.1C343.3 308.4 358.5 307.7 368.3 316.7C378 325.7 378.6 340.9 369.6 350.6C347.7 374.5 309.7 400 256 400C202.3 400 164.3 374.5 142.4 350.6C133.4 340.9 133.1 325.7 143.7 316.7C153.5 307.7 168.7 308.4 177.6 318.1C192.8 334.5 218.8 352 256 352zM208.4 208C208.4 225.7 194 240 176.4 240C158.7 240 144.4 225.7 144.4 208C144.4 190.3 158.7 176 176.4 176C194 176 208.4 190.3 208.4 208zM281.9 230.6C273.9 223 273.5 210.4 281 202.3C295.6 186.8 316.3 180 335.6 180C354.1 180 375.7 186.8 390.2 202.3C397.8 210.4 397.4 223 389.3 230.6C381.2 238.1 368.6 237.7 361 229.7C355.6 223.8 346.3 220 335.6 220C324.1 220 315.7 223.8 310.2 229.7C302.7 237.7 290 238.1 281.9 230.6zM512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256zM256 48C141.1 48 48 141.1 48 256C48 370.9 141.1 464 256 464C370.9 464 464 370.9 464 256C464 141.1 370.9 48 256 48z" />
                                                                                        </symbol>
                                                                                        </svg>
                                                                                    </button>
                                                                                </li>

                                                                                <li class="nav-item pe-2 send">
                                                                                    <button class="d-block btn-send" id="btn-send_${post.getId()}">
                                                                                        <svg>
                                                                                        <use xlink:href="#icon-send" />
                                                                                        </svg>
                                                                                        <svg style="display: none;" xmlns="http://www.w3.org/2000/svg"
                                                                                             version="1.1">
                                                                                        <symbol id="icon-send" viewBox="0 0 512 512"
                                                                                                xmlns="http://www.w3.org/2000/svg">
                                                                                            <path
                                                                                                d="M501.6 4.186c-7.594-5.156-17.41-5.594-25.44-1.063L12.12 267.1C4.184 271.7-.5037 280.3 .0431 289.4c.5469 9.125 6.234 17.16 14.66 20.69l153.3 64.38v113.5c0 8.781 4.797 16.84 12.5 21.06C184.1 511 188 512 191.1 512c4.516 0 9.038-1.281 12.99-3.812l111.2-71.46l98.56 41.4c2.984 1.25 6.141 1.875 9.297 1.875c4.078 0 8.141-1.031 11.78-3.094c6.453-3.625 10.88-10.06 11.95-17.38l64-432C513.1 18.44 509.1 9.373 501.6 4.186zM369.3 119.2l-187.1 208.9L78.23 284.7L369.3 119.2zM215.1 444v-49.36l46.45 19.51L215.1 444zM404.8 421.9l-176.6-74.19l224.6-249.5L404.8 421.9z" />
                                                                                        </symbol>

                                                                                        </svg>
                                                                                    </button>
                                                                                </li>
                                                                            </ul>
                                                                        </nav>
                                                                    </c:if>
                                                                    <c:if test="${empty sessionScope.account}">
                                                                        <button class="btn-require-login w-100"><a href="/register">Bạn cần đăng nhập để bình luận</a></button>

                                                                    </c:if>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="tab">
                            <input type="radio" name="css-tabs" id="tab-2" class="tab-switch">
                            <label for="tab-2" class="tab-label"><span label-lang="PERSONAL_TAB_PHOTOS" class="multilang"></span></label>
                            <div class="tab-content">

                                <style>
                                    .grid {
                                        display: grid;
                                        grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
                                        grid-gap: 5px;
                                        align-items: stretch;
                                    }

                                    .grid img {
                                        border-radius: 3px;
                                        max-width: 100%;
                                    }
                                </style>
                                <div class="grid">
                                    <c:forEach items="${requestScope.POSTS}" var="post">
                                        <c:forEach items="${post.getImageModels()}" var="image">
                                            <img src="${image.getUrl()}" alt="">
                                        </c:forEach>
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
        <script src="../template/js/language.js"></script>
        <script src="../template/js/script.js"></script>
        <script src="../template/js/home.js"></script>
    </body>
    
</html>
