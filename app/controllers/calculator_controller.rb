class CalculatorController < ApplicationController
  
  attr_accessor :results, :amount, :remainder
  
  def index
    @amount = params[:amount]
    self.remainder = @amount
    self.results = Hash.new
    @app = {}    
    
    if params.has_key?(:amount) 
      
      denominations = Denomination.order(value: :desc)
      
      denominations.each do |denomination|
        if(BigDecimal.new(self.remainder) > denomination.value)
          change_maker(denomination.name, denomination.value)
          remaining(denomination.value)
        end
      end
      
      @app = self.results

    end
    
  end

  
  private
    
    def change_maker(name, value)
      self.results[name] = (BigDecimal.new(self.remainder) / value).floor
    end
    
    def remaining(value)
      self.remainder = BigDecimal.new(self.remainder) % value
    end
end
