require './lib/ETSII_GEM.rb'

class MatrizDSL < EtsiiGem::Matriz
  attr_accessor :resultado	
  
  def initialize(t_operacion, &block)

      @operandos = []
      @resultado = nil
      @tipo_resultado = :densa
      @operacion = :nada

        def [](i)
            @operandos[i]
        end
      
      case t_operacion
        when "suma"
          @operacion = :suma
        when "resta"
          @operacion = :resta
        when "multiplicacion"
          @operacion = :multiplicacion
        else
          puts "Operación inválida", t_operacion
      end

      if block_given?
        if block.arity == 1
          yield self
        else
          instance_eval &block
        end
      end
  end

   def operando(mat)
      @operandos << mat
   end

	def  operar
		case @operacion
			when :suma
				@resultado = @operandos[0]+@operandos[1]
				@resultado
			when :resta
				@resultado = @operandos[0]-@operandos[1]
				@resultado
			when :multiplicacion
				@resultado = @operandos[0]*@operandos[1]
				@resultado
			else
          			puts "Operación inválida", @operacion
			end
		end

end

