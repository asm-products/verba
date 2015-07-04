require "rails_helper"

describe Refund do
  it { should belong_to(:user) }
end
