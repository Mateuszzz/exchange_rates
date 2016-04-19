class ExchangeRatesPdf < Prawn::Document
  def initialize(exchange_rates, date)
    super()
    @exchange_rates = exchange_rates
    @date = date
    
    header
    content
  end

  def header
    text "Exchange rates of #{@date}", size: 24, style: :bold, align: :center
    move_down 30
  end

  def content
    table currencies_rows do
      row(0).font_style = :bold
      column(1).style :align => :center
      column(2).style :align => :center
      column(3).style :align => :center
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.position = :center
    end
  end

  def currencies_rows
    [['Currency name', 'Currency code', 'Conversion rate', 'Average exchange rate']] +
      @exchange_rates.map do |currency|
        [currency.css('nazwa_waluty').text, currency.css('kod_waluty').text, currency.css('przelicznik').text, currency.css('kurs_sredni').text]
    end
  end
end