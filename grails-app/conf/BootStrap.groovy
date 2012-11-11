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
    			new Game(date: (new Date()+1), teams:gameTeams).save()
    			gameTeams = []
    		}
    	}
		
        //new Location(name: 'Bar Veloso', description: 'O bar mais original!', address: 'Rua Aristides Espínola, 44 - Leblon', location:[]).save()
		//new Location(name: 'Pizzaria Guanabara', description: 'A pizza mais gostosa!', address: 'Avenida Ataulfo de Paiva, 1228 - Leblon', location:[]).save()
		//new Location(name: 'Melt Bar e Restaurante', description: 'O melhor bar e restaurante!', address: 'Rua Rita Ludolf, 47 - Leblon', location:[]).save()
		//new Location(name: 'Bar e Restaurante Jobi', description: 'Chopp bom e bagunça boa.', address: 'Avenida Ataulfo de Paiva, 1166 - Leblon', location:[]).save()
		//new Location(name: 'Black Bar', description: 'Ótimos drinks e ambiente animado!', address: 'Avenida General San Martin, 1227', location:[]).save()
		//new Location(name: 'Prima Bruschetteria', description: 'A melhor bruschetta você encontra aqui!', address: 'Rua Rainha Guilhermina, 95 - Leblon', location:[]).save()
		//new Location(name: 'Conversa Fiada', description: 'A conversa mais fiada!', address: 'Avenida Ataulfo de Paiva, 900, Leblon', location:[]).save()
		//new Location(name: 'Bar Bracarense', description: 'Os bacarenses mais animados!', address: 'Rua José Linhares, 85, Leblon', location:[]).save()
		
		new Location(name: 'Cosmopolitan', description: 'Restaurante ideal!', address: 'Rua da Assembléia, 13 - Centro', location:[-22.904344d,-43.174875d]).save(failOnError: true)
		new Location(name: 'Bar Ao Vivo', description: 'O bar que sabe!', address: 'Rua São José, 8', location:[-22.903633d,-43.174381d]).save()
		new Location(name: 'Antigamente Bar e Restaurante', description: 'A melhor feijoada das sextas-feiras!', address: 'Rua do Ouvidor, 43 - Centro', location:[-22.901538d,-43.175583d]).save()
		new Location(name: 'Bar Luiz', description: 'Um dos mais tradicionais bares do Rio.', address: 'Rua da Carioca, 39 - Centro', location:[-22.905906d,-43.18011d]).save()
		new Location(name: 'O Príncipe dos Galetos', description: 'O galeto mais príncipe!', address: 'Avenida Nilo Peçanha, 44, Centro', location:[-22.90555d,-43.174896d]).save()
		new Location(name: 'Devassa Centro - Rj', description: 'A devassidão mais barista!', address: '', location:[-22.901202d,-43.177106d]).save()
		new Location(name: 'Amarelinho', description: 'Tradição e amarelice no centro do Rio!', address: 'Praça Floriano, 55 - Centro', location:[-22.909365d,-43.176248d]).save()
		new Location(name: 'Esch Café', description: 'Melhor cafe do centro do Rio.', address: 'Rua do Rosário, 107 - Centro', location:[-22.902071d,-43.177729d]).save()
		new Location(name: 'Boteco Casual', description: 'A melhor casualidade!', address: 'Rua do Ouvidor, 26 - Centro', location:[-22.900806d,-43.175197d]).save()
		new Location(name: 'Bar Monteiro', description: 'Encerrou atividades no segundo semestre de 2010.', address: 'Rua da Quitanda, 83 - Centro', location:[-22.901735d,-43.177257d]).save()
		new Location(name: 'Lord Bar', description: 'Bar para quem quer tranquilidade.', address: 'Rua da Quitanda, 30', location:[-22.903613d,-43.17627d]).save()

        new Location(name: 'Botequim Informal - Via Brasil', description: 'Melhor chopp do Rio de Janeiro', address: 'Shopping Via Brasil - Rua Itapera, 500', location:[22.814795d,-43.264847d]).save()
        new Location(name: 'Enchendo Linguiça - Lapa', description: 'Unindo suas melhores habilidades - atendimento ao público e idéias gastronômicas originais – Claudio e Fernando decidiram, em 2006, que era o momento de criar um inovador botequim carioca. Para o espaço nada melhor que comprar um botequim de portugueses, que estava à venda, com mais de 60 anos de existência, conhecido pelo Bar do Santa Cruz, e transformá-lo no Enchendo Lingüiça.', address: 'Av. Mem de Sá, 132 - Lapa, Esquina com Rua dos Inválidos', location:[-22.867634d,-43.262444d]).save()
        new Location(name: 'Bar do Adão - Tijuca', description: 'Mais de sessenta tipos de pastéis em um só lugar', address: 'Rua dos Artistas, 130', location:[-22.917508d,-43.237832d]).save()
        new Location(name: 'Bar do Adonis', description: 'Os pratos são preparados com os melhores produtos de procedência qualificada  para garantir a qualidade do sabor especial que só aqui você encontra.', address: 'Shopping Nova América', location:[22.873012d,-43.270168d]).save()

		Game.list(max: 2).each { game ->
			def loc = Location.findByName('Esch Café')
			new Event(game: game, location:loc).save()
		}
    }
	
    def destroy = {
    
	}
}
