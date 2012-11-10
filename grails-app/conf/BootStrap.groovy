import pubcup.*

class BootStrap {

    def init = { servletContext ->

    	Game.list()*.delete()
        Location.list()*.delete()
		Event.list()*.delete()

    	def teams 		= TeamsEnum.values()
    	def gameTeams	= []
    	
    	teams.eachWithIndex { team, i ->
    		gameTeams.add team
    		if( (i+1) % 2 == 0 ) {
    			new Game(date: new Date(), teams:gameTeams).save()
    			gameTeams = []
    		}
    	}
		
        def location = new Location(name: 'Botequim Informal - Via Brasil', description: 'Melhor chopp do Rio de Janeiro', address: 'Shopping Via Brasil - Rua Itapera, 500', location:[22.814795d,-43.264847d]).save()
        new Location(name: 'Enchendo Linguiça - Lapa', description: 'Unindo suas melhores habilidades - atendimento ao público e idéias gastronômicas originais – Claudio e Fernando decidiram, em 2006, que era o momento de criar um inovador botequim carioca. Para o espaço nada melhor que comprar um botequim de portugueses, que estava à venda, com mais de 60 anos de existência, conhecido pelo Bar do Santa Cruz, e transformá-lo no Enchendo Lingüiça.', address: 'Av. Mem de Sá, 132 - Lapa, Esquina com Rua dos Inválidos', location:[-22.867634d,-43.262444d]).save()
        new Location(name: 'Bar do Adão - Tijuca', description: 'Mais de sessenta tipos de pastéis em um só lugar', address: 'Rua dos Artistas, 130', location:[-22.917508d,-43.237832d]).save()
        new Location(name: 'Bar do Adonis', description: 'Os pratos são preparados com os melhores produtos de procedência qualificada  para garantir a qualidade do sabor especial que só aqui você encontra.', address: 'Shopping Nova América', location:[22.873012d,-43.270168d]).save()

		Game.findAll().each { game ->
			def event = new Event(game: game, location: location).save()
		}
    }
	
    def destroy = {
    
	}
}
