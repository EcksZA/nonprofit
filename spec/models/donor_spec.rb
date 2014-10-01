require 'rails_helper'

describe Donor do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
end
