package com.woori.myhome;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.woori.myhome.DIYBoard.DIYBoardDto;
import com.woori.myhome.DIYBoard.DIYBoardService;
import com.woori.myhome.ReceipeBoard.ReceipeBoardDto;
import com.woori.myhome.ReceipeBoard.ReceipeBoardService;
import com.woori.myhome.noticeboard.NoticeBoardDto;
import com.woori.myhome.noticeboard.NoticeBoardService;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @Resource(name="DIYboardService")
   DIYBoardService DiyService;
   
   @Resource(name="ReceipeboardService")
   ReceipeBoardService ReceipeService;
   
   @Resource(name="noticeBoardService")
   NoticeBoardService NoticeService;
   
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model,DIYBoardDto dto, ReceipeBoardDto rdto, NoticeBoardDto ndto) {
      logger.info("Welcome home! The client locale is {}.", locale);
      
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      List<DIYBoardDto> list = DiyService.getList(dto);
      model.addAttribute("serverTime", formattedDate );
      model.addAttribute("galleryList", list );
      
      List<ReceipeBoardDto> rlist = ReceipeService.getList(rdto);
      model.addAttribute("receipeList", rlist );
      
      List<NoticeBoardDto> nlist = NoticeService.getList(ndto);
      model.addAttribute("noticeboard_list", nlist );
      
      
      return "home";
   }
   
}
