require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "
          INSERT INTO customers (name, funds)
          VALUES ($1, $2)
          RETURNING id
          "
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)
    @id = customer.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    data = SqlRunner.run(sql)
    return data.map{|customer| Customer.new(customer)}
  end

  def update()
    sql = "
          UPDATE customers SET (name, funds) = ($1, $2)
          WHERE id = $3
          "
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def all_films()
    sql = "
          SELECT films.* FROM films
          INNER JOIN tickets ON tickets.films_id = films.id
          WHERE customer_id = $1;
          "
    values = [@id]
    data = SqlRunner.run(sql, values)
    return data.map{|hash| Film.new(hash) }
  end

end
