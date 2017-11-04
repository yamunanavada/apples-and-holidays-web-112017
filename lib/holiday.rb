require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array

  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].collect do |holiday, supplies|
    supplies.push(supply)
  end


end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash.collect do |seasons, holidays|
    if seasons == season
      holiday_hash[seasons][holiday_name] = supply_array
    end
  end
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  supply_array = []
  holiday_hash[:winter].each do |holiday, supplies|
    supply_array << supplies
  end
  supply_array.flatten
end


def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays|
      seasons_name = season.to_s
      seasons_name = seasons_name.capitalize!
      seasons_name += ":"
      puts seasons_name

      holidays.each do |holiday, supplies|
        holiday_name = holiday.to_s

        #Convert the holiday itself into a string
        if holiday_name.index("_") != nil
          holiday_name = holiday_name.split("_")
          holiday_name.collect do |x|
            x =  x.capitalize!
          end
          holiday_name = holiday_name.join(" ")
          holiday_name += ": "
          else
            holiday_name = holiday_name.split
            holiday_name = holiday_name.join(" ")
            holiday_name = holiday_name.capitalize!
            holiday_name += ": "
         end
         holiday_name = "  " + holiday_name

        i = 0
        supplies.collect do |x|
          holiday_name += x.to_s
          if i < supplies.length - 1
            holiday_name += ", "
          end
          i+=1
        end

      puts holiday_name
      end
    end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  includes_BBQ = [] #will house the holidays with BBQ

holiday_hash.each do |season, holidays|
  holidays.each do |holiday, supplies|
    supplies.each do |supply|
      if supply == "BBQ"
        includes_BBQ.push(holiday)
      end
    end
    


  end
end

includes_BBQ

end
