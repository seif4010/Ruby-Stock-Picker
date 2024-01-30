def stock_picker(prices)
  # Check if the prices array has at least two days
  if prices.length < 2
    puts "Not enough days to pick stocks."
    return nil
  end

  # Initialize variables to keep track of the best buy and sell days
  best_buy_day = 0
  best_sell_day = 1
  max_profit = prices[best_sell_day] - prices[best_buy_day]

  # Nested loop to iterate through each day and find the best buy and sell days
  (0...prices.length - 1).each do |buy_day|
    ((buy_day + 1)...prices.length).each do |sell_day|
      current_profit = prices[sell_day] - prices[buy_day]

      # Update best buy and sell days if a better profit is found
      if current_profit > max_profit
        best_buy_day = buy_day
        best_sell_day = sell_day
        max_profit = current_profit
      end
    end
  end

  # Return the best buy and sell days as a pair
  [best_buy_day, best_sell_day]
end

# Example usage:
stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
result = stock_picker(stock_prices)
puts "Best day to buy: #{result[0]}, Best day to sell: #{result[1]}"
