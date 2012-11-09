package pubcup

enum FifaConfederationsCup {
	
	A1("BRAZIL","BR"),
	A2,
	A3,
	A4,
	
	B1,
	B2,
	B3,
	B4
	
	def name
	def code
	
	FifaConfederationsCup(String name, String code){
		this.name = name
		this.code = code
	}
	
}
