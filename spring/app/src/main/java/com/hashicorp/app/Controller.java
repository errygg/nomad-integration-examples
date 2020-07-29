package com.hashicorp.app;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

@RestController
public class Controller {

  @Autowired
  private Environment env;

  @RequestMapping("/")
  public String index() {
    String token = env.getProperty("VAULT_TOKEN");

    return "HashiCorp Vault App example with VAULT_TOKEN: " + token;
  }
}
