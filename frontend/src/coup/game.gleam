import gleam/list
import json/game_message as msg
import lustre_websocket as ws

pub type Game {
  Game(id: String, player: Player, players: List(Player), socket: ws.WebSocket)
}

pub type Player {
  Player(name: String)
}

pub fn new(socket: ws.WebSocket) -> Game {
  Game(id: "", player: Player(name: ""), players: [], socket:)
}

pub fn init(
  game: Game,
  msg_game: msg.Game,
  msg_player: msg.Player,
  msg_players: List(msg.Player),
) -> Game {
  let player = Player(name: msg_player.name)
  let players =
    msg_players
    |> list.map(fn(p) { Player(name: p.name) })
  Game(..game, id: msg_game.id, player:, players:)
}

pub fn update_players(game: Game, msg_players: List(msg.Player)) -> Game {
  let players =
    msg_players
    |> list.map(fn(p) { Player(name: p.name) })
  Game(..game, players:)
}
