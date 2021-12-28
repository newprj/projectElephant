package com.green.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.service.UserService;
import com.green.service.VisitService;
import com.green.vo.AttachImageVO;
import com.green.vo.Cri;
import com.green.vo.PageMaker;
import com.green.vo.SCri;
import com.green.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/user/*")
@Slf4j
public class UserController {

	@Setter(onMethod_ = @Autowired)
	UserService userservice;
	
	@Setter(onMethod_ = @Autowired)
	VisitService visitService;

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
	
	@GetMapping("/modify2")
	public void modify2(@RequestParam("uno")int uno,Model model) {
		UserVO vo = userservice.view(uno);
		model.addAttribute("view",vo);
	}

	@PostMapping("/modify")
	public String modifyPost(UserVO vo, HttpSession session) {
		userservice.modify(vo);
		logout(session);
		// 회원정보 수정 후 로그아웃?
		return "redirect:/user/login";
	}
	
	@PostMapping("/modify2")
	public String modifyPost2(UserVO vo, HttpSession session) {
		userservice.modify(vo);
		logout(session);
		return "redirect:/user/listSearch";
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
		visitService.insertVisitor();
		return "/user/login";
	}
	
	
	@PostMapping("/login")
	public void loginPost(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		HttpSession session = req.getSession();
		UserVO login = userservice.login(vo);
		if(login == null) {
			rttr.addFlashAttribute("msg", false);
		}
		else {
			session.setAttribute("user", login);
		}
		
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
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", userservice.list());
		return "user/list";
	}
	
	@GetMapping("/view")
	public void view(@RequestParam("uno")int uno, Model model) {
		UserVO vo = userservice.view(uno);
		model.addAttribute("view", vo);
	}
	
	@GetMapping("/listPage")
	public void listPage(@ModelAttribute("cri") Cri cri, Model model) {
		List<UserVO> list = userservice.listPage(cri);
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(userservice.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@GetMapping("/listSearch")
	public void listSearch(@ModelAttribute("scri") SCri scri, Model model) {
		List<UserVO> list = userservice.listSearch(scri);
		model.addAttribute("list", list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(userservice.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@PostMapping(value="/upload", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadPost(MultipartFile[] uploadFile) {
		
		for(MultipartFile multipartFile : uploadFile) {
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			try {
				type = Files.probeContentType(checkfile.toPath());
			} catch(IOException e) {
				e.printStackTrace();
			}
			if(!type.startsWith("image")) {
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
			
		}
		
		String uploadFolder = "C:\\upload";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		File uploadPath = new File(uploadFolder, datePath);
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		List<AttachImageVO> list = new ArrayList();
		
		for(MultipartFile multipartFile : uploadFile) {
			
			AttachImageVO vo = new AttachImageVO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			
			File saveFile = new File(uploadPath, uploadFileName);
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(vo);
		}
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list,HttpStatus.OK);
		return result;
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		File file = new File("c:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		File file = null;
		
		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			String originalFileName = file.getAbsolutePath().replace("_", "");
			file = new File(originalFileName);
			file.delete();
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int id){
		return new ResponseEntity<List<AttachImageVO>>(userservice.getAttachList(id),HttpStatus.OK);
	}

}

