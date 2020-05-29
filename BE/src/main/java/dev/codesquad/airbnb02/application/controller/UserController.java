package dev.codesquad.airbnb02.application.controller;

import dev.codesquad.airbnb02.application.dto.UserFavoriteResponseDto;
import dev.codesquad.airbnb02.domain.user.business.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

  private final UserService userService;

  @PutMapping("/{userId}/favorite/add")
  public ResponseEntity<UserFavoriteResponseDto> addFavorite(@PathVariable Long userId,
      @RequestParam Long roomid) {
    return ResponseEntity.ok(userService.addFavorite(userId, roomid));
  }

  @PutMapping("/{userId}/favorite/delete")
  public ResponseEntity<UserFavoriteResponseDto> deleteFavorite(@PathVariable Long userId,
      @RequestParam Long roomid) {
    return ResponseEntity.ok(userService.deleteFavorite(userId, roomid));
  }
}