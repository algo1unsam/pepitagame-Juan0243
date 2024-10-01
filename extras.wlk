import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANE! :)")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {

	method image() = "silvestre.png"

	method restriction()  = pepita.position().x()

	method position() = game.at(self.restriction().max(3), 0)
	
	method teEncontro(ave) {
		return game.say(ave, "PERDI! :(")
		game.schedule(2000, { game.stop() })
	}
}
