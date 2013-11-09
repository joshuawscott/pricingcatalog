require 'spec_helper'

describe ListPrice do
  it { should belong_to(:product) }
  it { should validate_presence_of(:price) }
end
