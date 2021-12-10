package com.green.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.service.UserService;
import com.green.vo.UserVO;

import lombok.Setter;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Setter(onMethod_ = @Autowired)
	UserService userservice;

	@GetMapping("/register")
	public String register() {
		return "/user/register";
	}

	@PostMapping("/register")
	public String registerPost(UserVO vo) {
		userservice.register(vo);
		return "redirect:/user/login";
	}

	@GetMapping("/modify")
	public String modify() {
		return "/user/modify";
	}

	@PostMapping("/modify")
	public String modifyPost(UserVO vo, HttpSession session) {
		userservice.modify(vo);
		logout(session);
		return "redirect:/user/login";
	}

	@GetMapping("/delete")
	public String delete() {
		return "/user/delete";
	}

	@PostMapping("/delete")
	public String deletePost(UserVO vo, HttpSession session, RedirectAttributes rttr) {
		UserVO user = (UserVO) session.getAttribute("user");
		String sessionPass = user.getPassword();
		String voPass = vo.getPassword();

		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/user/delete";
		}
		userservice.delete(vo);
		logout(session);
		return "redirect:/user/login";
	}

	@GetMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	
	@PostMapping("/login")
	public String loginPost(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		HttpSession session = req.getSession();
		UserVO login = userservice.login(vo);
		
		if(login == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
		}
		else {
			session.setAttribute("user", login);
		}
		return "redirect:/user/login";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/user/login";
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheckPost(HttpServletRequest req) {
		String user_id = req.getParameter("user_id");
		UserVO idCheck = userservice.idCheck(user_id);
		int result = 0;
		if(idCheck != null) {
			result = 1;
		}
		return result;
	}
}










