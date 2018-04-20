package omfg.controller;

import omfg.model.Tag;
import omfg.model.User;
import omfg.model.Video;
import omfg.service.SecurityService;
import omfg.service.TagService;
import omfg.service.UserService;
import omfg.service.VideoService;
import omfg.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;


/**
 * Controller for {@link User}.
 */

@Controller
public class UserController {

    private VideoService videoService;

    private TagService tagService;

    @Autowired
    @Qualifier(value = "videoService")
    public void setVideoService(VideoService videoService) {
        this.videoService = videoService;
    }

    @Autowired
    @Qualifier(value = "tagService")
    public void setTagService(TagService tagService) {
        this.tagService = tagService;
    }

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;


    //================INDEX========================

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(Model model, Authentication authentication) {
        model.addAttribute("listvideo", videoService.getAll());
        return "index";
    }


    //=================FAVOURITE======================

    @RequestMapping(value = {"/favourite"}, method = RequestMethod.GET)
    public String favourite(Model model, Authentication authentication) {
        if(authentication!=null) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            User user = userService.findByUsername(userDetails.getUsername());
            model.addAttribute("listvideo", user.getFvideos());
        }
        return "index";
    }




    //===================VIDEOPAGE/LIKE/DISLIKE====================

    @RequestMapping(value = "videopage/{id}")
    public String videoPage(@PathVariable("id") int id, Model model, Authentication authentication) {
        Video video = videoService.getById(id);
        Set<Tag> tags = video.getTags();
        model.addAttribute("video", video);
        model.addAttribute("tags", tags);

        if(authentication!=null) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            User user = userService.findByUsername(userDetails.getUsername());
            model.addAttribute("ifLiked", userService.iflike(user.getId(), id));
        }
        else model.addAttribute("ifLiked", false);

        return "videopage";
    }

    @RequestMapping(value = "/dislike/{videoId}", method = RequestMethod.GET)
    public String dislike(@PathVariable("videoId") int vid, Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = userService.findByUsername(userDetails.getUsername());
        userService.dislike(user.getId(), videoService.getById(vid));
        return "redirect:/videopage/"+vid;
    }

    @RequestMapping(value = "/like/{videoId}", method = RequestMethod.GET)
    public String like(@PathVariable("videoId") int vid, Authentication authentication) {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = userService.findByUsername(userDetails.getUsername());
        userService.like(user.getId(), videoService.getById(vid));
        return "redirect:/videopage/"+vid;
    }






    //==================SEARCH=====================

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(Model model) {
        model.addAttribute("tags", tagService.getAll());
        return "search";
    }

    @RequestMapping(value = "result", method = RequestMethod.POST)
    public String result(Model model, HttpServletRequest request) {
        model.addAttribute("listvideo", videoService.getVideosWith(request.getParameterMap()));
        return "index";
    }




    //===============REGISTRATION/LOGIN==================

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model){
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()){
            return "registration";
        }
        userService.save(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout){
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");
        }
        if (logout != null) {
            model.addAttribute("message", "Logged out seccessfully.");
        }
        return "login";
    }

}
