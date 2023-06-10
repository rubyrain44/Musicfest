package com.johnp.musicfest.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;


import com.johnp.musicfest.models.Lineup;
import com.johnp.musicfest.models.LoginUser;
import com.johnp.musicfest.models.User;
import com.johnp.musicfest.services.LineupService;
import com.johnp.musicfest.services.UserService;

@Controller
public class MainController {

	@Autowired
	private UserService users;
	@Autowired
	private LineupService lineups;

    
    @GetMapping("/")
    public String index(Model model) {
    
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
    	User user = users.register(newUser, result);
    	
        
        if(result.hasErrors()) {

            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        User user = users.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
    
        session.setAttribute("userId", user.getId());
    
        return "redirect:/home";
    }
    
    
    @GetMapping("/home")
    public String home(@ModelAttribute("lineup") Lineup lineup, Model model, HttpSession session) {
    	
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	model.addAttribute("lineups", lineups.all());


    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "home.jsp";
    }
    
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
   
    
    
    
    @GetMapping("/addLineup")
    public String addLineup(@ModelAttribute("lineup") Lineup lineup,  BindingResult results, Model model, HttpSession session) {
    	
    	User user = users.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	
    	return "create.jsp";
    }
    
    @PostMapping("/submit")
    public String createBook(@Valid @ModelAttribute("lineup") Lineup lineup, BindingResult result) {

    	if (result.hasErrors()) {
    		return "addCar.jsp";
    	}
    	
    	lineups.create(lineup);
    	
    	return "redirect:/home";
    }
    
//user ID!!!!
    @GetMapping("/view/{id}")
    public String viewPage(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Lineup lineup = lineups.findById(id);
    	model.addAttribute("lineup", lineup);
   	
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	return "view.jsp";
    }
    
    @GetMapping("/lineup/edit/{id}")
    public String editLineup(Model model, @PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Lineup lineup = lineups.findById(id);
    	model.addAttribute("lineup", lineup);
    	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
    	
    	return "edit.jsp";
    }
//    
    @PutMapping("/lineup/{id}/edit")
    public String updateLineup(Model model, @Valid @ModelAttribute("lineup") Lineup lineup, BindingResult result, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	
    	if(result.hasErrors()) {
    		return "edit.jsp";
    	}
    	
    	lineups.update(lineup);
    	
    	return "redirect:/home";
    }
    
//    @PutMapping("/lineup/{id}/edit")
//    public String edit(@Valid @ModelAttribute("lineup") Lineup lineup, Model model, BindingResult result, @PathVariable("id") Long id, HttpSession session) {
//        Long idU = (Long) session.getAttribute("userId");
//        User loggedUser = users.findById(idU);
//        model.addAttribute("user", loggedUser);
//        lineup.setUser(loggedUser);
//        if (result.hasErrors()) {
//            return "thoughts_edit.jsp";
//        } else {
//            lineup.setId(id);
//            lineups.update(lineup);
//            return "redirect:/home";
//        }
//    }
//    
    

    
	@GetMapping("/lineup/delete/{id}")
	public String deleteLineup(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("userId")== null) {
			return "redirect:/";
		}

		lineups.delete(id);
		return "redirect:/home";
	}

    @GetMapping("/taylor")
    public String taylor() {

        return "taylor.jsp";
    }
    
    @GetMapping("/elton")
    public String elton() {

        return "elton.jsp";
    }
    @GetMapping("/cash")
    public String cash() {

        return "cash.jsp";
    }
    @GetMapping("/credit")
    public String credit() {

        return "credit.jsp";
    }
    

}