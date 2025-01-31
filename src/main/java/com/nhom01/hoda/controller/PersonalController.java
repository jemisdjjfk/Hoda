package com.nhom01.hoda.controller;

import com.nhom01.hoda.model.FollowUserModel;
import com.nhom01.hoda.model.PostModel;
import com.nhom01.hoda.model.UserModel;
import com.nhom01.hoda.service.IFollowUserService;
import com.nhom01.hoda.service.IPostService;
import com.nhom01.hoda.service.IUserService;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/personal"})
public class PersonalController extends HttpServlet {

    @Inject
    IUserService userService;

    @Inject
    IPostService postService;

    @Inject
    IFollowUserService followUserService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        Long uid = Long.parseLong(request.getParameter("id"));
        HttpSession session = request.getSession();
        if (session.getAttribute("account") != null) {
            Long following = ((UserModel) session.getAttribute("account")).getId();
            FollowUserModel followUserModel = followUserService.getFollowUser(following, uid);
            request.setAttribute("ISFOLLOW", followUserModel != null);
        }
        

        UserModel userModel = userService.findUserById(uid);
        List<PostModel> postModels = postService.getAllPostOfUser(uid);
        List<FollowUserModel> follower = followUserService.getAllFollowerOfUser(uid);
        List<FollowUserModel> following = followUserService.getAllFollowingOfUser(uid);
        
        request.setAttribute("USER", userModel);
        request.setAttribute("POSTS", postModels);
        request.setAttribute("FOLLOWERS", follower);
        request.setAttribute("FOLLOWINGS", following);
        
        if (session.getAttribute("lang") == null) {
            session.setAttribute("lang", "en-US");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/views/personal.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
