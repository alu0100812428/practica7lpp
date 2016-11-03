class Menu
    attr_reader :titulo, :porcentaje, :descripcion, :porciones, :ingesta
    def initialize(titulo,porcentaje,desc,porc,gramos)
        #Titulo
        regexp = /\s*(\w*)\s*(DESAYUNO|MEDIO MAÑANA|ALMUERZO|MERIENDA|CENA)\s*(\w*)\s*/
        resultado = regexp.match(titulo)
        
        if (resultado == nil )
            raise "Titulo no válido"
        elsif ((resultado[1] != "") || (resultado[3] != ""))
            raise "Titulo no válido"
        end
        
        @titulo = resultado[2]
        
        #Porcentaje
        if !porcentaje.is_a?(Array) 
            raise "El porcentaje no es un array"
        elsif porcentaje.length > 2
            raise "El rango del porcentaje tiene que estar entre dos numeros,se han especificado 3 o mas"
        elsif (porcentaje.length == 2) && !(porcentaje[0].is_a?(Integer) && porcentaje[1].is_a?(Integer))
           raise "Uno de los numeros del rango no es un entero"
        elsif (porcentaje.length) == 1 && !(porcentaje[0].is_a?(Integer))
            raise "El porcentaje no es un entero"
        elsif porcentaje.length == 0
            raise "El porcentaje no se ha especificado"
        end
        
        @porcentaje = porcentaje
        
        #Descripcion de un plato
        if !desc.is_a?(Array)
            raise "Las descripciones de plato no estan en un array"
        elsif desc.length >= 1
            desc.each{ |descripcion|
                if !descripcion.is_a?(String)
                    raise "Las descripciones de plato deben ser cadena sde caracteres"
                end
            }
        elsif desc.length == 0
            raise "Las descripciones de plato no han sido especificadas"
        end
        
        @descripcion = desc
        
        #Porcion recomendada de un plato
        if !porc.is_a?(Array)
            raise "Las porciones de plato no estan en un array"
        elsif porc.length >= 1
            porc.each{ |porcion|
                if !porcion.is_a?(String)
                    raise "Las porciones de plato deben ser cadenas de caracteres"
                end
            }
        elsif porc.length == 0
            raise "Las descripciones de plato no han sido especificadas"
        end
        
        @porciones = porc
        
        #Ingesta de un plato
        if !gramos.is_a?(Array)
            raise "Las ingestas de plato no estan en un array"
        elsif gramos.length >= 1
            gramos.each{ |ingesta|
                if !ingesta.is_a?(Integer)
                    raise "Las ingestas de plato deben ser numeros"
                end
            }
        elsif gramos.length == 0
            raise "Las ingestas de plato no han sido especificadas"
        end
        
        @ingesta = gramos
        
    end
end