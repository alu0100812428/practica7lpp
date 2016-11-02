class Menu
    attr_reader :titulo
    def initialize(titulo)
        regexp = /\s*(\w*)\s*(DESAYUNO|MEDIO MAÑANA|ALMUERZO|MERIENDA|CENA)\s*(\w*)\s*/
        resultado = regexp.match(titulo)
        
        if (resultado == nil )
            raise "Titulo no válido"
        elsif ((resultado[1] != "") || (resultado[3] != ""))
            raise "Titulo no válido"
        end
        
        @titulo = resultado[2]
        
    end
end