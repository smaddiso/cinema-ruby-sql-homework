require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :showing_date, :showing_time, :film_id, :customer_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @showing_date = options["showing_date"]
    @showing_time = options["showing_time"]
    @film_id = options["film_id"].to_i
    @customer_id = options["customer_id"].to_i
  end

  def save()
    sql = "INSERT INTO tickets (showing_date, showing_time, film_id, customer_id) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@showing_date, @showing_time, @film_id, @customer_id]
    ticket = SqlRunner.run(sql, values)[0];
    @id = ticket["id"].to_i
  end

  def update()
    sql = "UPDATE tickets SET (showing_date, showing_time, film_id, customer_id) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@showng_date, @showing_time, @movie_id, @star_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tickets where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def film()
    sql = "SELECT * FROM films WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run(sql, values)[0]
    return Film.new(film)
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values)[0]
    return Customer.new(customer)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    ticket_data = SqlRunner.run(sql)
    return ticket_data.map{|ticket| Ticket.new(ticket)}
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
