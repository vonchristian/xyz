class Isbn::Conversions::VersionTen < ActiveInteraction::Base
  string :isbn # Sample: 1-56619-909-3, 978-1-56619-909-4

  validates :isbn, presence: true

  def execute
    return errors.add('Invalid ISBN') unless @isbn.is_a?(String)

    @isbn = isbn.delete("-")

    return errors.add('No 10 digit ISBN available') if @isbn =~ /^979/

    validate_length
    validate_check_digit

    @isbn
  end

  def validate_length
    case @isbn.size
    when 10 then @isbn = @isbn[0..8]
    when 13 then @isbn = @isbn[/(?:^978|^290)*(.{9})\w/,1] #remove prefixed numbers and remove check digit
    else
      return errors.add('Invalid 10 digit ISBN')
    end
  end

  def validate_check_digit
    case check_digit
    when 10 then @isbn << "X"
    when 11 then @isbn << "0"
    else
      @isbn << check_digit.to_s
    end
  end

  # ISBN-10 check digit calculation
  # See https://en.wikipedia.org/wiki/ISBN#ISBN-10_check_digit_calculation

  def check_digit
    (11 - (@isbn.split(//).zip((2..10).to_a.reverse).inject(0) {|s,n| s += n[0].to_i * n[1] } % 11))
  end
end
