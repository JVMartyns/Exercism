defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(:earth, seconds) do
    {:ok, Float.round(seconds / 31_557_600, 2)}
  end

  def age_on(:mercury, seconds) do
    {:ok, years} = age_on(:earth, seconds)
    {:ok, Float.round(years / 0.2_408_467, 2)}
  end

  def age_on(:venus, seconds) do
    {:ok, years} = age_on(:earth, seconds)
    {:ok, Float.floor(years / 0.61519726, 2)}
  end

  def age_on(:mars, seconds) do
    {:ok, years} = age_on(:earth, seconds)
    {:ok, Float.round(years / 1.8808158, 2)}
  end

  def age_on(:jupiter, seconds) do
    {:ok, years} = age_on(:earth, seconds)
    {:ok, Float.round(years / 11.862615, 2)}
  end

  def age_on(:saturn, seconds) do
    {:ok, years} = age_on(:earth, seconds)
    {:ok, Float.round(years / 29.447498, 2)}
  end

  def age_on(:uranus, seconds) do
    {:ok, years} = age_on(:earth, seconds)
    {:ok, Float.round(years / 84.016846, 2)}
  end

  def age_on(:neptune, seconds) do
    {:ok, years} = age_on(:earth, seconds)
    {:ok, Float.round(years / 164.79132, 2)}
  end

  def age_on(_, _), do: {:error, "not a planet"}
end
