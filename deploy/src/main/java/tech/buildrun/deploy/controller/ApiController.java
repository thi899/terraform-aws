package tech.buildrun.deploy.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;

@RestController
@RequestMapping("hello")
public class ApiController {

    @GetMapping
    public ResponseEntity<TimeStampResponse> helloAws() {
      return ResponseEntity.ok(new TimeStampResponse(Instant.now()));
    }

}
