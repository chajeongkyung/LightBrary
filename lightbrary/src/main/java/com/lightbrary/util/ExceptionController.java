package com.lightbrary.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExceptionController {

   private static final Logger log = 
      LoggerFactory.getLogger(ExceptionController.class);
   
   @RequestMapping(value="/error/400.do", method=RequestMethod.GET)
   public String error400Exeption() {
      log.info("* * * * * 400 ERROR !!! * * * * *");
      
      return "common/failPage";
   }

   @RequestMapping(value="/error/404.do", method=RequestMethod.GET)
   public String error404Exeption() {
	   log.info("* * * * * 404 ERROR !!! * * * * *");
	   
	   return "common/failPage";
   }
   
   @RequestMapping(value="/error/500.do", method=RequestMethod.GET)
   public String error500Exeption() {
	   log.info("* * * * * 500 ERROR !!! * * * * *");
      
      return "common/failPage";
   }
   
}