require 'spec_helper'

describe Price do
  it { should belong_to(:product) }
end
