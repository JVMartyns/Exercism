defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: hourly_rate * 8 / 1

  def apply_discount(before_discount, discount) do
    before_discount - before_discount / 100 * discount
  end

  def monthly_rate(hourly_rate, discount) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount)
    |> Kernel.*(22)
    |> Float.ceil()
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget
    |> Kernel./(
      hourly_rate
      |> daily_rate()
      |> apply_discount(discount)
    )
    |> Float.floor(1)
  end
end
