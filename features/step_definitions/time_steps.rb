# frozen_string_literal: true

Given('the date is {string}') do |date_string|
  date = Date.parse(date_string)
  Timecop.freeze(date)
end
