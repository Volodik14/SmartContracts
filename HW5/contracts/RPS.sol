// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

enum HandFigure {
    None, Rock, Paper, Scissors
}

enum GameResult {
    None, Tie, FirstWin, SecondWin
}

contract RPS {
    address public firstPlayer;
    address public secondPlayer;
    address public judge;

    mapping(address => HandFigure) private handFigures;

    event GameOver(string message, GameResult result, HandFigure firstPlayer, HandFigure secondPlayer);
    event RestartGame(string message);

    // Added judge for using modifiers in hw
    modifier OnlyJudge() {
        require(judge == msg.sender, "Sender must be the judge");
        _;
    }

    modifier OnlyPlayer() {
        require(msg.sender == firstPlayer || msg.sender == secondPlayer, "Sender must be the player");
        _;
    }

    function join() public {
        require(firstPlayer == address(0) || secondPlayer == address(0), "Game already setted");
        if (firstPlayer == address(0)) {
            firstPlayer = msg.sender;
        } else {
            secondPlayer = msg.sender;
        }
    }

    function startNewGame() internal {
        emit RestartGame("New Game");
        delete handFigures[firstPlayer];
        delete handFigures[secondPlayer];
        firstPlayer = address(0);
        secondPlayer = address(0);
    }

    function chooseHand(HandFigure hand) public OnlyPlayer {
        handFigures[msg.sender] = hand;
        if (handFigures[firstPlayer] != HandFigure.None && handFigures[secondPlayer] != HandFigure.None) {
            checkHands();
        }
    }

    function checkHands() internal {
        HandFigure firstPlayerHand = handFigures[firstPlayer];
        HandFigure secondPlayerHand = handFigures[secondPlayer];
        int result = int(uint(firstPlayerHand) - uint(secondPlayerHand));
        if (result == 1) {
            emit GameOver("First player Won!", GameResult.FirstWin, firstPlayerHand, secondPlayerHand);
        } else if (result == -1) {
            emit GameOver("Second player Won!", GameResult.SecondWin, firstPlayerHand, secondPlayerHand);
        }
        else if (result == 0) {
            emit GameOver("Tie!", GameResult.Tie, firstPlayerHand, secondPlayerHand);
        }
        else {
            if (result == 2) {
                emit GameOver("Second player Won!", GameResult.SecondWin, firstPlayerHand, secondPlayerHand);
            } else {
                emit GameOver("First player Won!", GameResult.FirstWin, firstPlayerHand, secondPlayerHand);
            }
        }
        restartGame();
    }

    function restartGame() public OnlyJudge {
        startNewGame();
    }

    // Setting the judge in init
    constructor() {
        judge = msg.sender;
    }
}