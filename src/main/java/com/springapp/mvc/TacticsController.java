package com.springapp.mvc;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class TacticsController {
    @Autowired
    private TacticsRepository tacticsRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public String listTactics(ModelMap model) {
        model.addAttribute("tactic", new TacticsEntity());
        model.addAttribute("tactics", tacticsRepository.findAll());
        return "tactics";
    }

    @ResponseBody
    @RequestMapping(value = "/api/tactics/{level}", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
    public Object[] listTacticsJson(ModelMap model, @PathVariable("level") String level) throws JSONException {
        return tacticsRepository.findByLevel(level).toArray();
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    public String addTactics(@ModelAttribute("tactic") TacticsEntity tactics, BindingResult result) {
        tacticsRepository.save(tactics);
        return "redirect:/";
    }

    @RequestMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        tacticsRepository.delete(tacticsRepository.findOne(id));
        return "redirect:/";
    }
}