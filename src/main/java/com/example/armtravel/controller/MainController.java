package com.example.armtravel.controller;

import com.example.armtravel.model.Region;
import com.example.armtravel.model.User;
import com.example.armtravel.model.UserType;
import com.example.armtravel.repository.RegionRepository;
import com.example.armtravel.repository.UserRepository;
import com.example.armtravel.security.CurrentUser;
import com.example.armtravel.util.EmailServiceImpl;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import java.util.UUID;

@Controller
public class MainController {

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private EmailServiceImpl emailService;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RegionRepository regionRepository;
    @Autowired
    private File getFilePath;
    @Value("${armtravel.product.upload.path}")
    private String imageUploadPath;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String mainPage(ModelMap map, @AuthenticationPrincipal UserDetails userDetails, Locale locale) {
        //map.addAttribute("user", new User());
        map.addAttribute("allRegions", regionRepository.findAll());
        if (userDetails != null) {
            User user = ((CurrentUser) userDetails).getUser();
            map.addAttribute("currentUser", user);

        }
        return "index";
    }

    @GetMapping(value = "/")
    public String redirectHomePage() {
        return "redirect:/home";
    }

    @RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
    public String loginSuccess() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null && authentication.getPrincipal() instanceof CurrentUser) {
            CurrentUser principal = (CurrentUser) authentication.getPrincipal();
            if (principal.getUser().getType() == UserType.ADMIN) {
                return "redirect:/admin";
            }
            if (principal.getUser().getType() == UserType.USER) {
                return "redirect:/userPage";
            }
            return "redirect:/";
        }

        return "index";
    }

    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public String login(ModelMap map) {
        map.addAttribute("user", new User());
        return "login-register";
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@ModelAttribute("user") User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setType(UserType.USER);
        user.setVerify(false);
        user.setToken(UUID.randomUUID().toString());
        userRepository.save(user);
        String url = String.format("http://localhost:8080/verify?token=%s&email=%s", user.getToken(), user.getEmail());
        String text = String.format("Dear %s Thank you, you have successfully registered to our ArmTravel, Please visit by link in order to activate your profile. %s", user.getName(), url);
        emailService.sendSimpleMessage(user.getEmail(), "Welcome", text);
        return "redirect:/loginPage";
    }

    @RequestMapping(value = "/verify", method = RequestMethod.GET)
    public String verify(@RequestParam("token") String token, @RequestParam("email") String email) {
        User oneByEmail = userRepository.findOneByEmail(email);
        if (oneByEmail != null) {
            if (oneByEmail.getToken() != null && oneByEmail.getToken().equals(token)) {
                oneByEmail.setToken(null);
                oneByEmail.setVerify(true);
                userRepository.save(oneByEmail);
            }
        }
        return "redirect:/";
    }

    @GetMapping("/404")
    public String Page404() {
        return "404";
    }

    @RequestMapping(value = "/verifyError", method = RequestMethod.GET)
    public String verifyError() {
        return "verifyError";
    }


    @RequestMapping(value = "/image", method = RequestMethod.GET)
    public void getImageAsByteArray(HttpServletResponse response, @RequestParam("fileName") String fileName) throws IOException {
        InputStream in = new FileInputStream(imageUploadPath + fileName);
        response.setContentType(MediaType.ALL_VALUE);
        IOUtils.copy(in, response.getOutputStream());
    }

    @GetMapping("/rSinglePage")
    public String rSinglePage(@RequestParam("rId") int id, ModelMap map) {
        Region region = regionRepository.findOne(id);
        map.addAttribute("region", region);
        return "rSPage";
    }

}
