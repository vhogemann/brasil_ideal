package pubcup



import grails.test.*
import org.junit.*
import pubcup.Location

import grails.test.mixin.domain.DomainClassUnitTestMixin

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(LocationService)
@TestMixin(DomainClassUnitTestMixin)
class LocationServiceTests {

    void testFindForExistentLocationInDatadatabase() {

        mockDomain(Location, [
    		[name: 'Botequim Informal - Via Brasil', description: 'Melhor chopp do Rio de Janeiro', address: 'Shopping Via Brasil - Rua Itapera, 500', location:[22.814795,-43.264847]],
    		[name: 'Enchendo Linguiça - Lapa', description: 'Unindo suas melhores habilidades - atendimento ao público e idéias gastronômicas originais – Claudio e Fernando decidiram, em 2006, que era o momento de criar um inovador botequim carioca. Para o espaço nada melhor que comprar um botequim de portugueses, que estava à venda, com mais de 60 anos de existência, conhecido pelo Bar do Santa Cruz, e transformá-lo no Enchendo Lingüiça.', address: 'Av. Mem de Sá, 132 - Lapa, Esquina com Rua dos Inválidos', location:[-22.867634,-43.262444]],
    		[name: 'Bar do Adão - Tijuca', description: 'Mais de sessenta tipos de pastéis em um só lugar', address: 'Rua dos Artistas, 130', location:[-22.917508,-43.237832]],
    		[name: 'Bar do Adonis', description: 'Os pratos são preparados com os melhores produtos de procedência qualificada  para garantir a qualidade do sabor especial que só aqui você encontra.', address: 'Shopping Nova América', location:[22.873012,-43.270168]]
    	])

        def locations = LocationService.find('Ad')

        assertEquals('[testFindExistentLocationInDatadatabase] The returned list must have 2 elements', locations.size(), 2)
    }

    void testFindForNoExistentLocationInDatadatabase() {

    	mockDomain(Location, [
    		[name: 'Botequim Informal - Via Brasil', description: 'Melhor chopp do Rio de Janeiro', address: 'Shopping Via Brasil - Rua Itapera, 500', location:[22.814795,-43.264847]],
    		[name: 'Enchendo Linguiça - Lapa', description: 'Unindo suas melhores habilidades - atendimento ao público e idéias gastronômicas originais – Claudio e Fernando decidiram, em 2006, que era o momento de criar um inovador botequim carioca. Para o espaço nada melhor que comprar um botequim de portugueses, que estava à venda, com mais de 60 anos de existência, conhecido pelo Bar do Santa Cruz, e transformá-lo no Enchendo Lingüiça.', address: 'Av. Mem de Sá, 132 - Lapa, Esquina com Rua dos Inválidos', location:[-22.867634,-43.262444]],
    		[name: 'Bar do Adão - Tijuca', description: 'Mais de sessenta tipos de pastéis em um só lugar', address: 'Rua dos Artistas, 130', location:[-22.917508,-43.237832]],
    		[name: 'Bar do Adonis', description: 'Os pratos são preparados com os melhores produtos de procedência qualificada  para garantir a qualidade do sabor especial que só aqui você encontra.', address: 'Shopping Nova América', location:[22.873012,-43.270168]]
    	])

    	def locations = LocationService.find('Rua Toriba, Colegio, Rio de Janeiro')

    	assertTrue('[testFindForNoExistentLocationInDatadatabase] The returned list isnt empty', locations != null)
    }
}
