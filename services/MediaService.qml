pragma Singleton

import Quickshell
import Quickshell.Services.Mpris

Singleton {
    readonly property list<MprisPlayer> players: Mpris.players.values
    readonly property MprisPlayer first:  players[0]
    property string preferedPlayer: "Spotify"

    function identities(): list<string> {
        return players.map(player => player.identity);
    }

    function ofIdentity(id: string): MprisPlayer {
        console.log(JSON.stringify(players.find(player => player.identity == identity)))
        return players.find(player => player.identity == identity);
    }
}
