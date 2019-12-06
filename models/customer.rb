require_relative("../db/sql_runner")

class Customer

  attr_reader :id, :funds
  attr_accessor :name


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
          UPDATE customers SET name = $1
          WHERE id = $2
          "
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end
  
end
