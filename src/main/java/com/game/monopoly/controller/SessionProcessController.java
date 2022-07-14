package com.game.monopoly.controller;

import com.game.monopoly.dto.request.InitializeSessionDTO;
import com.game.monopoly.dto.request.RollDiceDTO;
import com.game.monopoly.dto.request.SessionIdDTO;
import com.game.monopoly.dto.response.RollDiceResultDTO;
import com.game.monopoly.dto.response.SessionStateDTO;
import com.game.monopoly.entity.Player;
import com.game.monopoly.service.SessionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import static com.game.monopoly.enums.SessionState.IN_PROGRESS;

@Controller
@RequiredArgsConstructor
public class SessionProcessController {
    private final SessionService sessionService;
    private final SimpMessagingTemplate simpMessagingTemplate;

    @MessageMapping(value = "/sessions/add-player")
    public ResponseEntity<Player> addPlayer(InitializeSessionDTO dto) {
        Player player = sessionService.addPlayerToSession(dto.getSessionId(), dto.getPlayerName(), dto.getColour());
        simpMessagingTemplate.convertAndSend("/topic/add-player/" + dto.getSessionId(), player);

        return ResponseEntity.ok().body(player);
    }

    @MessageMapping(value = "/sessions/roll-dice")
    public ResponseEntity<RollDiceResultDTO> getNewPlayerPosition(RollDiceDTO dto) {
        RollDiceResultDTO rollDiceResult = sessionService.rollDices(dto.getPlayerName());
        simpMessagingTemplate.convertAndSend("/topic/roll-dice/" + dto.getSessionId(), rollDiceResult);

        return ResponseEntity.ok().body(rollDiceResult);
    }

    @MessageMapping(value = "/sessions/start-game")
    public ResponseEntity<SessionStateDTO> startGame(SessionIdDTO dto) {
        sessionService.startGame(dto.getSessionId());
        SessionStateDTO result = new SessionStateDTO(IN_PROGRESS.toString());
        simpMessagingTemplate.convertAndSend("/topic/start-game/" + dto.getSessionId(), result);

        return ResponseEntity.ok().body(result);
    }
}
